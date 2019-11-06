#!perl
use strict;
use warnings;
use mro 'c3';

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
    if ( $expr =~ /\A\s*\*\s*\z/ ) {
        return larger_than('0.0.0');
    }

    if ( $expr =~ /\A\s*([^,]+),(.*\z)/ ) {
        return union_fn( expr_to_fn( $1, $package ),
            expr_to_fn( $2, $package ) );
    }

    die "Cannot convert expression $expr to resolver for $package";
}

sub req_missing {
    my ($req) = @_;
    dep_missing( $req->crate, $req->requirement, $req->for_crate->name,
        $req->for_crate->version,
        $req->for_reason, crate_versions( $req->crate ) );

}

sub resolve_req {
    my ($req) = @_;

    my (@found_versions) =
      $req->apply_requirement( crate_versions( $req->crate ) );
    if (@found_versions) {
        my $v = largest_version(@found_versions);
        return CrateInfo->new(
            name    => $req->crate,
            version => $v,
            %{ $deps{ $req->crate }{$v} }
        );

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
    my $for             = {};
    if (    exists $deps{ $opts->{for_package} }
        and exists $deps{ $opts->{for_package} }{ $opts->{for_version} } )
    {
        $for = $deps{ $opts->{for_package} }{ $opts->{for_version} };
    }

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
        my (@found_versions) =
          expr_to_fn( $version, $package )->(@versions);
        if (@found_versions) {
            return largest_version(@found_versions);
        }
        if (    $opts->{reason}
            and $opts->{reason} eq 'test'
            and $for->{problems}->{missing_tests} )
        {
            return;
        }
        if (    $opts->{reason}
            and $opts->{reason} eq 'optional'
            and $for->{problems}->{missing_options} )
        {
            return;
        }
        if (    $opts->{reason}
            and $opts->{reason} eq 'feature'
            and $for->{problems}->{missing_options} )
        {
            return;
        }

        dep_missing( $package, $version,
            $opts->{for_package}, $opts->{for_version}, $opts->{reason},
            @orig_versions );
        return undef;

    }
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

sub crate_names { sort keys %deps }

sub crate_versions {
    my $crate = shift;
    if ( not defined $crate ) {
        die "Illegal undef crate passed";
    }
    if ( not exists $deps{$crate} ) {
        die "No crate named $crate";
    }
    sort keys %{ $deps{$crate} };
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

sub crates {
    map {
        my $name = $_;
        map {
            CrateInfo->new(
                name    => $name,
                version => $_,
                %{ $deps{$name}{$_} }
              )
        } sort keys %{ $deps{$name} }
      }
      sort keys %deps;
}

sub crate_requirements {
    my $meta = crate_info(@_);
    map { { package => $_, requirement => $meta->{requires}->{$_} } }
      sort keys %{ $meta->{requires} || {} };
}

sub crate_test_requirements {
    my $meta = crate_info(@_);
    map { { package => $_, requirement => $meta->{test}->{$_} } }
      sort keys %{ $meta->{test} || {} };
}

sub crate_optional_requirements {
    my $meta = crate_info(@_);
    map { { package => $_, requirement => $meta->{optional}->{$_} } }
      sort keys %{ $meta->{optional} || {} };
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
    for my $crate ( crates() ) {
        ident_for( $crate->name, $crate->version );
    }
    for my $crate ( crates() ) {
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
{

    package Feature;

    sub new {
        my $self = $_[1];
        $self = { @_[ 1 .. $#_ ] } unless ref $self;
        bless $self, __PACKAGE__;
        $self->__CHECK;
        $self;
    }

    sub __CHECK {
        defined $_[0]->{name}    or die "No name for Feature";
        defined $_[0]->{members} or die "No members for Feature";
        defined $_[0]->{crate}   or die "No owner crate for Feature";
    }
    sub name    { $_[0]->{name} }
    sub members { $_[0]->{members} }
    sub crate   { $_[0]->{crate} }

    sub dependencies {
        my $self = $_[0];
        map {
            Requirement->new(
                crate       => $_->[0],
                requirement => $_->[1],
                for_crate   => $self->crate,
                for_reason  => 'feature:' . $self->name,
            );
        } ::expand_feature( $self->name, $self->crate->name,
            $self->crate->version );
    }
}
{

    package Requirement;

    sub new {
        my $self = $_[1];
        $self = { @_[ 1 .. $#_ ] } unless ref $self;
        bless $self, __PACKAGE__;
        $self->__CHECK;
        $self;
    }

    sub __CHECK {
        defined $_[0]->{crate}       or die "Missing crate";
        defined $_[0]->{requirement} or die "Missing requirement";
        defined $_[0]->{for_crate}   or die "Missing for_crate";
    }

    sub crate {
        $_[0]->{crate};
    }

    sub requirement {
        $_[0]->{requirement};
    }

    sub requirement_fn {
        exists $_[0]->{requirement_fn}
          ? $_[0]->{requirement_fn}
          : ( $_[0]->{requirement_fn} = ::expr_to_fn( $_[0]->requirement ) );
    }

    sub apply_requirement {
        $_[0]->requirement_fn()->( @_[ 1 .. $#_ ] );
    }

    sub for_crate {
        $_[0]->{for_crate};
    }

    sub for_reason {
        $_[0]->{for_reason} || '';
    }

    sub resolve {
        ::resolve_req( $_[0] );
    }
}
{

    package CrateInfo;

    sub new {
        my $self = $_[1];
        $self = { @_[ 1 .. $#_ ] } unless ref $self;
        bless $self, __PACKAGE__;
        $self->__CHECK;
        $self;
    }

    sub __CHECK {
        defined $_[0]->{name}    or die "No name for crate";
        defined $_[0]->{version} or die "No version for crate";
        if ( exists $_[0]->{requires} ) {
            'HASH' eq ref $_[0]->{requires}
              or die "Illegal value for requires (expected HASH)";
        }
        if ( exists $_[0]->{test} ) {
            'HASH' eq ref $_[0]->{test}
              or die "Illegal value for test (expected HASH)";
        }
        if ( exists $_[0]->{optional} ) {
            'HASH' eq ref $_[0]->{optional}
              or die "Illegal value for optional (expected HASH)";
        }
        if ( exists $_[0]->{problems} ) {
            'HASH' eq ref $_[0]->{problems}
              or die "Illegal value for problems (expected HASH)";
        }
        if ( exists $_[0]->{features} ) {
            'HASH' eq ref $_[0]->{features}
              or die "Illegal value for features (expected HASH)";
        }
    }

    sub name {
        $_[0]->{name};
    }

    sub version {
        $_[0]->{version};
    }

    sub __ident {
        ::ident_for( $_[0]->name, $_[0]->version );
    }

    sub requirements {
        my ($self) = @_;
        map {
            Requirement->new(
                {
                    crate       => $_,
                    requirement => $self->{requires}->{$_},
                    for_crate   => $self,
                }
              )
          }
          sort keys %{ $self->{requires} || {} };
    }

    sub test_requirements {
        my ($self) = @_;
        map {
            Requirement->new(
                {
                    crate       => $_,
                    requirement => $self->{test}->{$_},
                    for_crate   => $self,
                    for_reason  => 'test',
                }
              )
          }
          sort keys %{ $self->{test} || {} };
    }

    sub optional_requirements {
        my ($self) = @_;
        map {
            Requirement->new(
                {
                    crate       => $_,
                    requirement => $self->{optional}->{$_},
                    for_crate   => $self,
                    for_reason  => 'optional'
                }
              )
          }
          sort keys %{ $self->{optional} || {} };
    }

    sub has_problem {
        my ( $self, $problem ) = @_;
        !!$self->{problems}->{$problem};
    }

    sub link_to {
        my ( $self, $other, $reason ) = @_;

        if ( $other->has_problem(qw( missing )) ) {
            ::dep_missing(
                $self->name,     $self->version, $other->name,
                $other->version, $reason,        $other->version
            );
            return;
        }
        if ( $other->has_problem(qw( package_masked )) ) {
            ::dep_masked(
                $self->name,     $self->version, $other->name,
                $other->version, $reason,        $other->version
            );
            if ( defined $reason ) {
                $reason = "bad(dependency masked):$reason";
            }
            else {
                $reason = "bad(dependency masked)";
            }
        }
        ::assoc( $self->__ident, $other->__ident, $reason );
    }

    sub features {
        my ($self) = @_;
        map {
            Feature->new(
                name    => $_,
                members => $self->{features}->{$_},
                crate   => $self,
              )
          }
          sort keys %{ $self->{features} || {} };
    }
}

