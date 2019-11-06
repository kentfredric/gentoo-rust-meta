#!perl
use strict;
use warnings;
use mro 'c3';
use lib 'lib';
use CrateInfo;
use Requirement;
use Feature;
use Expressions;
use CrateDB;

BEGIN {
    *expr_to_fn = *Expressions::expr_to_fn;
}

my $db = CrateDB->new( meta_root => '/home/kent/rust/gentoo-rust-meta/meta' );

my $id_id = 1;
my %deps;
my %identities;
my %simple_graph;
my %unresolved;

for my $path ( $db->file_paths() ) {
    $db->load_file($path);
}
if ( $ENV{LEGACY} ) {
    for my $path ( $db->file_paths_suffix('legacy') ) {
        $db->load_file($path);
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

sub dep_masked {
    my ( $package, $version, $for_package, $for_version, $reason, @candidates )
      = @_;
    my $message =
"Required masked package \e[1;31m$version\e[0m for \e[1;31m$package\e[0m\n";
    $message .=
      "   in \e[31m$for_package\e[0m version \e[31m$for_version\e[0m\n";
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

sub req_missing {
    my ($req) = @_;

    dep_missing(
        $req->crate,
        $req->requirement,
        $req->for_crate->name,
        $req->for_crate->version,
        $req->for_reason,
        $db->has_crate( $req->crate ) ? $db->crate_versions( $req->crate ) : ()
    );

}

sub resolve_req {
    my ($req) = @_;

    if ( $db->has_crate( $req->crate ) ) {
        my (@found_versions) =
          $req->apply_requirement( $db->crate_versions( $req->crate ) );
        if (@found_versions) {
            my $v = largest_version(@found_versions);
            return CrateInfo->new(
                name    => $req->crate,
                version => $v,
                %{ $deps{ $req->crate }{$v} }
            );

        }
    }
    return
      if $req->for_reason eq 'test'
      and $req->for_crate->has_problem(qw( missing_tests ));

    if ( $req->for_crate->has_problem(qw( missing_options )) ) {
        return
          if $req->for_reason eq 'optional'
          or $req->for_reason eq 'feature';
    }
    req_missing($req);
    return undef;
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
            $stash->{requires}->{$build} =
              $opt_hash{build_requires}{$build};
        }
        delete $opt_hash{build_requires};
    }

    # Problem handling
    if ( exists $opt_hash{problems} and 'HASH' eq ref $opt_hash{problems} ) {
        $stash->{problems} = delete $opt_hash{problems};
    }
    if ( exists $opt_hash{problems} and 'ARRAY' eq ref $opt_hash{problems} ) {
        $stash->{problems} =
          { map { $_, 1 } @{ delete $opt_hash{problems} } };
    }
    $stash->{problems}->{missing_options} = delete $opt_hash{missing_options}
      if exists $opt_hash{missing_options};
    $stash->{problems}->{missing_tests} = delete $opt_hash{missing_tests}
      if exists $opt_hash{missing_tests};
    $stash->{problems}->{missing} = delete $opt_hash{missing}
      if exists $opt_hash{missing};
    $stash->{problems}->{package_masked} = delete $opt_hash{package_masked}
      if exists $opt_hash{package_masked};

    ## Done problem handling
    #
    $stash->{features} = delete $opt_hash{features}
      if exists $opt_hash{features};
    $stash->{test} = delete $opt_hash{test}
      if exists $opt_hash{test};
    $stash->{optional} = delete $opt_hash{optional}
      if exists $opt_hash{optional};

    if ( $ENV{AUTOFEATURE}
        or exists $opt_hash{test_features} and $opt_hash{test_features} )
    {
        delete $opt_hash{test_features};
        for my $feature ( sort keys %{ $stash->{feature} || {} } ) {
            for my $dep ( sort keys %{ $stash->{feature}->{$feature} } ) {
                $stash->{test}->{$dep} =
                  $stash->{feature}->{$feature}->{$dep};
            }
        }
        for my $optdep ( sort keys %{ $stash->{optional} || {} } ) {
            $stash->{test}->{$optdep} = $stash->{optional}->{$optdep};
        }
    }
    if ( keys %opt_hash ) {
        die "unknown keys: @{[ keys %opt_hash ]}";
    }
    $db->add( $name, $version, $deps{$name}{$version} );
}

sub expand_feature {
    my ( $name, $crate, $crate_version ) = @_;
    my $want_feature;
    if ( $name =~ /\A(.+?)\/(.+)\z/ ) {
        ( $name, $want_feature ) = ( "$1", "$2" );
    }
    if (   not exists $deps{$crate}
        or not exists $deps{$crate}{$crate_version} )
    {
        warn "Unknown crate $crate version $crate_version for feature $name";
        return ();
    }
    my $xcrate   = $deps{$crate}{$crate_version};
    my $features = exists $xcrate->{features} ? $xcrate->{features} : {};
    my $optional = exists $xcrate->{optional} ? $xcrate->{optional} : {};
    my $requires = exists $xcrate->{requires} ? $xcrate->{requires} : {};
    my $problems = exists $xcrate->{problems} ? $xcrate->{problems} : {};

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
    if ( $problems->{missing} ) {
        warn
"Can't resolve feature $name in (\e[35mmissing\e[0m) crate $crate version $crate_version";
        return ();
    }
    if ( $problems->{missing_tests} or $problems->{missing_options} ) {
        warn
"Can't resolve (\e[36moptional/test\e[0m) feature $name in crate $crate version $crate_version";
        return ();
    }
    die "Can't resolve feature $name in crate $crate version $crate_version";
}

sub crate_info {
    my ( $name, $version, $requestee ) = @_;
    unless ( exists $deps{$name}{$version} ) {
        die "Unknown dep $name v=$version for $requestee";
    }
    $deps{$name}{$version};
}

sub crate_info_ng {
    my ( $name, $version, $requestee ) = @_;
    unless ( exists $deps{$name}{$version} ) {
        die "Unknown dep $name v=$version for $requestee";
    }
    CrateInfo::new( $deps{$name}{$version} );
}

sub crate_problem {
    my $meta = crate_info( @_[ 0, 1, 2 ] );
    !!$meta->{problems}->{ $_[3] };
}

sub define_link {
    my ( $source_package, $source_version, $dest_package, $dest_version,
        $label, $requestee, @options )
      = @_;
    my $dep_requestee = "$source_package v=$source_version"
      . ( defined $requestee ? " $requestee" : "" );
    my ($source_meta) =
      crate_info( $source_package, $source_version, $requestee );
    if (
        crate_problem(
            $dest_package, $dest_version, $dep_requestee, 'missing'
        )
      )
    {
        dep_missing( $source_package, $source_version, $dest_package,
            $dest_version, $label, @options );
        return;
    }
    if (
        crate_problem(
            $dest_package, $dest_version, $dep_requestee, 'package_masked'
        )
      )
    {
        dep_masked( $source_package, $source_version, $dest_package,
            $dest_version, $label, @options );
        if ( defined $label ) {
            $label = "bad(dependency masked):$label";
        }
        else {
            $label = "bad(dependency masked)";
        }
    }
    assoc( ident_for( $source_package, $source_version ),
        ident_for( $dest_package, $dest_version ), $label );

}

sub resolve_deps {
    for my $crate ( $db->crates() ) {
        ident_for( $crate->name, $crate->version );
    }
    for my $crate ( $db->crates() ) {
        for my $requirement ( $crate->requirements ) {
            my $resolved_version = $requirement->resolve();
            next unless defined $resolved_version;
            $crate->link_to( $resolved_version, undef );
        }
        if ( !$ENV{MINIMAL} and !$crate->has_problem(qw( missing_tests )) ) {
            for my $requirement ( $crate->test_requirements ) {
                my $resolved_version = $requirement->resolve();
                next unless defined $resolved_version;
                $crate->link_to( $resolved_version, 'weak:test' );
            }
        }
        if ( !$ENV{MINIMAL} and !$crate->has_problem(qw( missing_options )) ) {
            for my $requirement ( $crate->optional_requirements ) {
                my $resolved_version = $requirement->resolve();
                next unless defined $resolved_version;
                $crate->link_to( $resolved_version, 'weak:optional' );
            }
        }
        if ( !$ENV{MINIMAL} and !$crate->has_problem(qw( missing_options )) ) {
            for my $feature ( $crate->features ) {
                for my $requirement ( $feature->dependencies ) {
                    my $resolved_version = $requirement->resolve();
                    next unless defined $resolved_version;
                    if ( $feature->name eq 'default' ) {
                        $crate->link_to( $resolved_version,
                            'feature:' . $feature->name );
                    }
                    else {
                        $crate->link_to( $resolved_version,
                            'weak:feature:' . $feature->name );

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
