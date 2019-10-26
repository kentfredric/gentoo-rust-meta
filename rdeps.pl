#!perl
use strict;
use warnings;

my $id_id = 1;
my %deps;
my %identities;
my %simple_graph;
my %unresolved;

my $prefix = '/home/kent/rust/gentoo-rust-meta/meta';
my (@bases) = qw( a b c d e f g h i j k l m n o p q r s t u w x y z );
if ( $ENV{LEGACY} ) {
    push @bases, 'legacy';
}

for my $i (@bases) {
    my $base_path = "${prefix}/${i}";
    my $path      = "${base_path}.pl";
    if ( -e $path ) {
        local $@;
        do "$path";
        die $@ if $@;
    }
    if ( -e $base_path and -d $base_path ) {
        opendir my ($dfh), $base_path;
        while ( my $ent = readdir $dfh ) {
            next if $ent =~ /\A\.\.?\z/;
            if ( -e "${base_path}/${ent}" && -d "${base_path}/${ent}" ) {
                opendir my $subdfh, "${base_path}/${ent}";
                while ( my $subent = readdir $subdfh ) {
                    next if $subent =~ /\A\.\.?\z/;
                    next unless $subent =~ /\.pl\z/;
                    my $file = "${base_path}/${ent}/${subent}";
                    local $@;
                    do "$file";
                    die $@ if $@;
                }
            }
        }
    }
}

resolve_deps();

for my $pair (
    sort { $a->[0] <=> $b->[0] }
    map { [ $identities{$_}, $_ ] } keys %identities
  )
{
    printf "%s %s\n", @{$pair};
}
print "#\n";
for my $key ( sort keys %simple_graph ) {
    for my $dep ( sort keys %{ $simple_graph{$key} } ) {
        my $has_reasons;
        for my $reason ( sort keys %{ $simple_graph{$key}{$dep} } ) {
            $has_reasons++;
            printf "%s %s %s\n", $key, $dep, $reason;
        }
        unless ($has_reasons) {
            printf "%s %s\n", $key, $dep;
        }
    }
}
if ( keys %unresolved ) {
    warn "\e[31;1mUnresolved:\e[0m\n";
    for my $package ( sort keys %unresolved ) {
        for my $version ( sort keys %{ $unresolved{$package} } ) {
            warn sprintf "- \e[32;1m%s %s\e[0m\n", $package, $version;
            for my $owner ( sort keys %{ $unresolved{$package}{$version} } ) {
                warn sprintf "\t\e[33;1m%s\e[0m\n", $owner;
            }
        }
    }
}

sub any_subversion {
    my ($subversion) = @_;
    return sub {

        #largest_version(
        grep { /\A\Q$subversion\E.?/ } @_

          # );
      }
}

sub range_excl {
    my $min = version->parse( $_[0] );
    my $max = version->parse( $_[1] );
    return sub {

        #largest_version(
        grep {
            my $cv = version->parse($_);
            $cv >= $min and $cv < $max
          } @_

          # );
    };
}

sub exact {
    my $wanted = version->parse( expando_version( $_[0] ) );
    return sub {
        grep { version->parse($_) eq $wanted } @_;
    };
}

sub larger_than {
    my $wanted = version->parse( expando_version( $_[0] ) );
    return sub {
        grep { version->parse($_) gt $wanted } @_;
    };
}

sub smaller_than {
    my $wanted = version->parse( expando_version( $_[0] ) );
    return sub {
        grep { version->parse($_) lt $wanted } @_;
    };
}

sub semver {
    my ( $v_prefix, $v_suffix ) = @_;
    my $min = version->parse( expando_version("${v_prefix}.${v_suffix}") );
    return sub {

        #  largest_version(
        grep { version->parse($_) >= $min }
          grep /\A\Q${v_prefix}\E([.]|\z)/,
          @_

          # );
    };
}

sub tilde {
    my ( $v_prefix, $v_suffix ) = @_;
    my $min = version->parse( expando_version("${v_prefix}.${v_suffix}") );
    my (@max) = split q/\./, $v_prefix;
    $max[-1]++;
    my $max = version->parse( expando_version( join q[.], @max, $v_suffix ) );
    return sub {
        grep {
            my $v = version->parse($_);
            $v >= $min
              and $v < $max
        } @_;
      }
}

sub union_fn {
    my (@fn_parts) = @_;
    return sub {
        my (@versions) = @_;
        for my $fn (@fn_parts) {
            @versions = $fn->(@versions);
        }
        return @versions;
      }
}

sub union {
    my ( $package, @parts ) = @_;
    my (@fn_parts) = map { expr_to_fn( $_, $package ) } @parts;
    return sub {
        my (@versions) = @_;
        for my $fn (@fn_parts) {
            @versions = $fn->(@versions);
        }
        return @versions;
      }
}

sub any_fn {
    my (@fn_parts) = @_;
    return sub {
        my (%todo) = map { ( $_ => 1 ) } @_;
        my (%matched);
        for my $fn (@fn_parts) {
            if ( keys %todo ) {
                for my $match ( $fn->( sort keys %todo ) ) {
                    $matched{$match} = delete $todo{$match};
                }
            }
        }
        return sort keys %matched;
    };
}

sub any {
    my ( $package, @parts );
    any_fn( map { expr_to_fn( $_, $package ) } @parts );
}

sub largest_version {
    [ sort { version->parse($b) <=> version->parse($a) } @_ ]->[0];
}

sub expando_version {
    my ($v) = @_;
    if ( $v =~ /\A\d+\.\d+\z/ ) {
        return "$v" . ".0";
    }
    return $v;
}

sub dep_missing {
    my ( $package, $version, $for_package, $for_version, $reason, @candidates )
      = @_;
    my $message =
      "Can't resolve \e[1;32m$version\e[0m for \e[1;32m$package\e[0m\n";
    $message .=
      "   in \e[33m$for_package\e[0m version \e[33m$for_version\e[0m\n";
    if ( not @candidates ) {
        $message .= "Candidates: \e[1;31mNone\e[0m";
    }
    else {
        $message .= "Candidates: \e[1m@candidates\e[0m";
    }
    $reason = ( defined $reason ) ? " $reason" : "";
    $unresolved{$package}{$version}{"$for_package $for_version$reason"}++;
    warn $message;

}

sub expr_to_fn {
    my ( $expr, $package ) = @_;
    if ( $expr =~ /\A\s*range_excl\(\s*([0-9.]+)\s*,\s*([0-9.]+)\s*\)\s*\z/ ) {
        return range_excl( $1, $2 );
    }
    if ( $expr =~ /\A\s*any_subversion\(\s*([0-9.]+)\s*\)\s*\z/ ) {
        return any_subversion($1);
    }
    if ( $expr =~ /\A\s*exact\(\s*([0-9][0-9.]*)\s*\)\s*\z/ ) {
        return exact($1);
    }
    if ( $expr =~ /\A\s*=([0-9][0-9.]*)\s*\z/ ) {
        return exact($1);
    }
    if ( $expr =~ /\A\s*>([0-9][0-9.]*)\s*\z/ ) {
        return larger_than($1);
    }
    if ( $expr =~ /\A\s*<([0-9][0-9.]*)\s*\z/ ) {
        return smaller_than($1);
    }
    if ( $expr =~ /\A\s*>=([0-9][0-9.]*)\s*\z/ ) {
        return any_fn( larger_than($1), exact($1) );
    }
    if ( $expr =~ /\A\s*<=([0-9][0-9.]*)\s*\z/ ) {
        return any_fn( smaller_than($1), exact($1) );
    }
    if ( $expr =~ /\A\^(0.[0-9]+)\z/ ) {
        return semver( $1, 0 );
    }
    if ( $expr =~ /\A\^(0.[0-9]+).([0-9][0-9.]*)\z/ ) {
        return semver( $1, $2 );
    }
    if ( $expr =~ /\A\^([0-9]+)\z/ ) {
        return semver( $1, "0.0" );
    }
    if ( $expr =~ /\A\^([0-9]+).([0-9][0-9.]*)\z/ ) {
        return semver( $1, $2 );
    }
    if ( $expr =~ /\A~([0-9]+)\z/ ) {
        return tilde( $1, "0.0" );
    }
    if ( $expr =~ /\A~([0-9]+\.[0-9]+)\z/ ) {
        return tilde( $1, "0" );
    }
    if ( $expr =~ /\A~([0-9]+\.[0-9]+)\.([0-9]+)\z/ ) {
        return tilde( $1, $2 );
    }

    if ( $expr =~ /\A\s*([^,]+),(.*\z)/ ) {
        return union_fn( expr_to_fn( $1, $package ),
            expr_to_fn( $2, $package ) );
    }

    die "Cannot convert expression $expr to resolver for $package";
}

sub resolve_dep {
    my ( $package, $version, $opts ) = @_;

    #    unless ( 'CODE' eq ref $version
    #        or $version =~ /\A\^/
    #        or $version =~ /\A~/
    #        or $version =~ /\(.+\)/ )
    #    {
    #        die "Illegal version spec $version for $package";
    #    }
    my (@versions)      = sort keys %{ $deps{$package} };
    my (@orig_versions) = (@versions);

    if ( 'CODE' eq ref $version ) {
        my $selected = $version->(@versions);
        return $selected if defined $selected;
        dep_missing( $package, "(dynamic rule)",
            $opts->{for_package}, $opts->{for_version}, $opts->{reason},
            @orig_versions );
        return undef;

    }
    else {
        my $selector = expr_to_fn( $version, $package );
        my (@found_versions) = expr_to_fn( $version, $package )->(@versions);
        if (@found_versions) {
            return largest_version(@found_versions);
        }
        dep_missing( $package, $version,
            $opts->{for_package}, $opts->{for_version}, $opts->{reason},
            @orig_versions );
        return undef;

    }
    if ( $version =~ /\(.+\)/ ) {
        my $selected = expr_to_fn($version)->(@versions);
        return $selected if defined $selected;
        dep_missing( $package, $version,
            $opts->{for_package}, $opts->{for_version}, $opts->{reason},
            @orig_versions );
        return undef;
    }
    if ( $version =~ /\A\^?0[.](\d+)[.]?/ ) {
        my $sem_max = $1;
        @versions = grep { /\A0[.]${sem_max}/ } @versions;
        my $vsel = $version;
        $vsel =~ s/\A\^//;
        my $min = version->parse( expando_version($vsel) );
        @versions = grep { version->parse($_) >= $min } @versions;
        if (@versions) {
            return largest_version(@versions);
        }
        dep_missing( $package, $version, $opts->{for_package},
            $opts->{for_version}, $opts->{reason}, @orig_versions );
        return undef;
    }
    elsif ( $version =~ /\A\^?(\d+)[.]?/ ) {
        my $sem_max = "$1";
        @versions = grep { /\A${sem_max}([.]|\z)/ } @versions;
        my $vsel = $version;
        $vsel =~ s/\A\^//;
        my $min = version->parse( expando_version($vsel) );
        @versions = grep { version->parse($_) >= $min } @versions;

        if (@versions) {
            return largest_version(@versions);
        }
        dep_missing( $package, $version, $opts->{for_package},
            $opts->{for_version}, $opts->{reason}, @orig_versions );
        return undef;

    }
    if ( $version =~ /\A~([\d.]+)\z/ ) {
        my ($spec_v) = "$1";
        my (@spec_parts) = ( split qr/[.]/, $spec_v );
        my $min;
        my $max;
        warn "$spec_v => @spec_parts";
        if ( 1 == scalar @spec_parts ) {
            $min = version->parse( expando_version($spec_v) );
            $max = version->parse( expando_version( $spec_parts[0] + 1 ) );
        }
        elsif ( 2 == scalar @spec_parts or 3 == scalar @spec_parts ) {
            $min = version->parse( expando_version($spec_v) );
            $max = version->parse(
                expando_version(
                    $spec_parts[0] . q[.] . ( $spec_parts[1] + 1 )
                )
            );
        }
        else {
            die "unhandled number of parts in ~<$spec_v>";
        }
        @versions = grep {
            my $v = version->parse($_);
            $min <= $v and $v < $max
        } @versions;
        if (@versions) {
            return largest_version(@versions);
        }
        dep_missing( $package, $version, $opts->{for_package},
            $opts->{for_version}, $opts->{reason}, @orig_versions );
        return undef;
    }
    die "Can't resolve $version for $package: Candidates @orig_versions";

}

sub crate {
    my ( $name, $version, %opt_hash ) = @_;
    if ( exists $deps{$name}{$version} ) {
        die "Can't redefine $name v=$version";
    }
    $deps{$name}{$version} = {};
    my $stash = $deps{$name}{$version};
    if ( exists $opt_hash{requires} ) {
        $stash->{requires} = delete $opt_hash{requires};
    }
    if ( exists $opt_hash{build_requires} ) {
        for my $build ( sort keys %{ $opt_hash{build_requires} } ) {
            if (    exists $stash->{requires}
                and exists $stash->{requires}->{$build} )
            {
                die
"Clobbered <requires> with <build_requires> in $name, $version";
            }
            $stash->{requires}->{$build} = $opt_hash{build_requires}{$build};
        }
        delete $opt_hash{build_requires};
    }
    if ( exists $opt_hash{feature} ) {
        $stash->{feature} = delete $opt_hash{feature};
    }
    if ( exists $opt_hash{features} ) {
        $stash->{features} = delete $opt_hash{features}
          unless $opt_hash{missing_options};
        delete $opt_hash{features};
    }
    if ( exists $opt_hash{test} or $opt_hash{missing_tests} ) {
        $stash->{test} = $opt_hash{test} unless $opt_hash{missing_tests};
        delete $opt_hash{test};
        delete $opt_hash{missing_tests};
    }
    if ( exists $opt_hash{optional} or $opt_hash{missing_options} ) {
        $stash->{optional} = $opt_hash{optional}
          unless $opt_hash{missing_options};
        delete $opt_hash{optional};
        delete $opt_hash{missing_options};
    }

    if ( exists $opt_hash{missing} ) {
        $stash->{missing} = delete $opt_hash{missing};
    }

    if ( $ENV{AUTOFEATURE}
        or exists $opt_hash{test_features} and $opt_hash{test_features} )
    {
        delete $opt_hash{test_features};
        for my $feature ( sort keys %{ $stash->{feature} || {} } ) {
            for my $dep ( sort keys %{ $stash->{feature}->{$feature} } ) {
                $stash->{test}->{$dep} = $stash->{feature}->{$feature}->{$dep};
            }
        }
        for my $optdep ( sort keys %{ $stash->{optional} || {} } ) {
            $stash->{test}->{$optdep} = $stash->{optional}->{$optdep};
        }
    }
    if ( keys %opt_hash ) {
        die "unknown keys: @{[ keys %opt_hash ]}";
    }
}

sub expand_feature {
    my ( $name, $crate, $crate_version ) = @_;
    my $want_feature;
    if ( $name =~ /\A(.+?)\/(.+)\z/ ) {
        ( $name, $want_feature ) = ( "$1", "$2" );
    }
    if ( not exists $deps{$crate} or not exists $deps{$crate}{$crate_version} )
    {
        warn "Unknown crate $crate version $crate_version for feature $name";
        return ();
    }
    my $xcrate   = $deps{$crate}{$crate_version};
    my $features = exists $xcrate->{features} ? $xcrate->{features} : {};
    my $optional = exists $xcrate->{optional} ? $xcrate->{optional} : {};
    my $requires = exists $xcrate->{requires} ? $xcrate->{requires} : {};

    if ( exists $features->{$name} ) {
        my @expanded;
        for my $item ( @{ $features->{$name} } ) {
            push @expanded, expand_feature( $item, $crate, $crate_version );
        }
        return @expanded;
    }
    if ( exists $optional->{$name} ) {
        if ( defined $want_feature ) {
            return ( [ $name, $optional->{$name}, $want_feature ] );
        }
        return ( [ $name, $optional->{$name} ] );
    }
    if ( exists $requires->{$name} ) {
        if ( defined $want_feature ) {
            return ();

            # TODO: Resolve dependency and check if the feature imports deps
            #return ( [ $name, $requires->{$name}, $want_feature ] );
        }
        return ();

        #        return ( [ $name, $xcrate->{requires}->{$name} ] );
    }
    die "Can't resolve feature $name in crate $crate version $crate_version";
}

sub resolve_deps {
    for my $o_pkg ( sort keys %deps ) {
        for my $o_version ( sort keys %{ $deps{$o_pkg} } ) {
            ident_for( $o_pkg, $o_version );
        }
    }
    for my $o_pkg ( sort keys %deps ) {
        for my $o_version ( sort keys %{ $deps{$o_pkg} } ) {
            my $vhash = $deps{$o_pkg}{$o_version};
            if ( exists $vhash->{requires} ) {
                for my $d_pkg ( sort keys %{ $vhash->{requires} } ) {
                    my $rv = $vhash->{requires}->{$d_pkg};
                    my $wv = resolve_dep( $d_pkg, $rv,
                        { for_package => $o_pkg, for_version => $o_version } );
                    next unless defined $wv;
                    unless ( exists $deps{$d_pkg}{$wv} ) {
                        die "Unknown dep $d_pkg v=$wv for $o_pkg v=$o_version";
                    }
                    if ( $deps{$d_pkg}{$wv}{missing} ) {
                        dep_missing( $d_pkg, $wv, $o_pkg, $o_version, undef,
                            $wv );
                        next;
                    }
                    assoc(
                        ident_for( $o_pkg, $o_version ),
                        ident_for( $d_pkg, $wv )
                    );
                }
            }
            if ( exists $vhash->{test} && !$ENV{MINIMAL} ) {
                for my $d_pkg ( sort keys %{ $vhash->{test} } ) {
                    my $rv = $vhash->{test}->{$d_pkg};
                    my $wv = resolve_dep( $d_pkg, $rv,
                        { for_package => $o_pkg, for_version => $o_version } );
                    next unless defined $wv;
                    unless ( exists $deps{$d_pkg}{$wv} ) {
                        die "Unknown dep $d_pkg v=$wv for $o_pkg v=$o_version";
                    }
                    if ( $deps{$d_pkg}{$wv}{missing} ) {
                        dep_missing( $d_pkg, $wv, $o_pkg, $o_version, 'test',
                            $wv );
                        next;
                    }

                    assoc( ident_for( $o_pkg, $o_version ),
                        ident_for( $d_pkg, $wv ), "weak:test" );
                }
            }
            if ( exists $vhash->{optional} && !$ENV{MINIMAL} ) {
                for my $d_pkg ( sort keys %{ $vhash->{optional} } ) {
                    my $rv = $vhash->{optional}->{$d_pkg};
                    my $wv = resolve_dep( $d_pkg, $rv,
                        { for_package => $o_pkg, for_version => $o_version } );
                    next unless defined $wv;
                    unless ( exists $deps{$d_pkg}{$wv} ) {
                        die "Unknown dep $d_pkg v=$wv for $o_pkg v=$o_version";
                    }
                    if ( $deps{$d_pkg}{$wv}{missing} ) {
                        dep_missing( $d_pkg, $wv, $o_pkg, $o_version,
                            'optional', $wv );
                        next;
                    }

                    assoc(
                        ident_for( $o_pkg, $o_version ),
                        ident_for( $d_pkg, $wv ),
                        "weak:optional"
                    );
                }
            }
            if ( exists $vhash->{features} ) {
                if ( ref $vhash->{features} ne 'HASH' ) {
                    die "illegal features for  $o_pkg $o_version";
                }
                my $expanded_features = {};
                for my $feature ( sort keys %{ $vhash->{features} } ) {
                    my (@feature_reqs) =
                      expand_feature( $feature, $o_pkg, $o_version );
                    for my $defn (@feature_reqs) {
                        $expanded_features->{$feature}->{ $defn->[0] } =
                          $defn->[1];
                    }
                }
                for my $feature ( sort keys %{$expanded_features} ) {
                    if (    exists $vhash->{feature}
                        and exists $vhash->{feature}->{$feature} )
                    {
                        die
"Clobbered redefintion of $feature for $o_pkg v=$o_version";
                    }
                    $vhash->{feature}->{$feature} =
                      $expanded_features->{$feature};
                }
            }
            if ( exists $vhash->{feature} && !$ENV{MINIMAL} ) {
                for my $feature ( sort keys %{ $vhash->{feature} } ) {

                    for
                      my $d_pkg ( sort keys %{ $vhash->{feature}->{$feature} } )
                    {
                        my $rv = $vhash->{feature}->{$feature}->{$d_pkg};
                        my $wv = resolve_dep(
                            $d_pkg, $rv,
                            {
                                for_package => $o_pkg,
                                for_version => $o_version
                            }
                        );
                        next unless defined $wv;
                        unless ( exists $deps{$d_pkg}{$wv} ) {
                            die
"Unknown dep $d_pkg v=$wv for $o_pkg v=$o_version";
                        }
                        if ( $deps{$d_pkg}{$wv}{missing} ) {
                            dep_missing( $d_pkg, $wv, $o_pkg, $o_version,
                                "feature:$feature", $wv );
                            next;
                        }
                        my $fname =
                          $feature eq 'default'
                          ? 'feature:default'
                          : "weak:feature:${feature}";
                        assoc( ident_for( $o_pkg, $o_version ),
                            ident_for( $d_pkg, $wv ), $fname );
                    }
                }
            }

        }
    }
}

sub ident_for {
    my ( $package, $version ) = @_;
    my $key = "$package $version";
    return $identities{$key} if exists $identities{$key};
    $identities{$key} = $id_id;
    $id_id++;
    return $identities{$key};
}

sub assoc {
    my ( $parent, $child, $reason ) = @_;
    if ( not exists $simple_graph{$parent}{$child} ) {
        $simple_graph{$parent}{$child} = {};
    }
    if ( defined $reason ) {
        $simple_graph{$parent}{$child}{$reason} = 1;
    }
}
