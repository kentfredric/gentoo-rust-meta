#!perl
use strict;
use warnings;

my %redox = (
    requires => {
        'redox_syscall' => '^0.1',
    }
);
my %unix = (
    requires => {
        libc => '^0.2',
    },
    optional => {
        xattr => '^0.2',
    }
);
crate(
    tar      => '0.4.26',
    requires => {
        filetime => '^0.2.6',
        %{ $unix{requires} }
    },
    optional => { %{ $unix{optional} } },
    test     => {
        tempdir => '^0.3',
    },
    features => {
        default => [qw( xattr )],
    }
);
