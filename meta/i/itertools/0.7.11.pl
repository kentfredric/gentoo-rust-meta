#!perl
use strict;
use warnings;

crate(
    itertools     => '0.7.11',
    missing_tests => 1,
    requires      => {
        either => '^1',
    },
    test => {
        permutohedron => '^0.2',
        quickcheck    => '^0.5',
    },
    features => {
        default => [qw( use_std )],
        use_std => [],
    }
);
