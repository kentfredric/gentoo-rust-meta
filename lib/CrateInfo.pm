use 5.006;    # our
use strict;
use warnings;

package CrateInfo;

our $VERSION = '0.001000';

# ABSTRACT: Abstract description of crate metadata

# AUTHORITY

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

1;

