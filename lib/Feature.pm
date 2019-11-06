use 5.006;    # our
use strict;
use warnings;

package Feature;

our $VERSION = '0.001000';

# ABSTRACT: Crate feature representation

# AUTHORITY

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

1;

