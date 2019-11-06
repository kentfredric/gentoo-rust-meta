use 5.006;    # our
use strict;
use warnings;

package Requirement;

our $VERSION = '0.001000';

# ABSTRACT: Container of a crates requirements

# AUTHORITY

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

1;

