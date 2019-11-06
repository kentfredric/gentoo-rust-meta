use 5.006;    # our
use strict;
use warnings;

package CrateDB;

our $VERSION = '0.001000';

# ABSTRACT: Database of Crate information

# AUTHORITY

sub new {
    my $self = {};
    bless $self, __PACKAGE__;
    $self->__CHECK;
    $self;
}

sub __CHECK {

}

sub load_file {
    my ( $self, $path ) = @_;
    return unless -e $path;
    local $@;
    do "$path";
    die $@ if $@;
}

sub add {
    my ( $self, $name, $version, $meta ) = @_;
    $self->{crates}->{$name}->{$version} = CrateInfo->new(
        {
            name    => $name,
            version => $version,
            %{$meta}
        }
    );
}

sub crate_names {
    sort keys %{ $_[0]->{crates} };
}

sub crate_versions {
    my ( $self, $crate ) = @_;
    if ( not defined $crate ) {
        die "Illegal undef crate passed";
    }
    if ( not exists $self->{crates}->{$crate} ) {
        die "No crate named $crate";
    }
    sort keys %{ $self->{crates}->{$crate} };
}

sub crates {
    my ( $self, ) = @_;
    map {
        my $crate = $_;
        map { $self->{crates}->{$crate}->{$_} } $self->crate_versions($crate)
    } $self->crate_names;
}

BEGIN { *crate = *::crate }

1;

