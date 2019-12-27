#!perl
use strict;
use warnings;

crate(
    itertools => '0.8.2',
    requires  => {
        either => '^1',
    },
    test => {
        permutohedron => '^0.2',
        quickcheck    => '^0.7',
        rand          => '^0.6',
    },
    features => {
        default => [qw( use_std )],
        use_std => [],
    }
);
