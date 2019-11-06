#!perl
use strict;
use warnings;

crate(
    ordermap      => '0.3.5',
    missing_tests => 1,
    optional      => {
        serde => '^1',
    },
    test => {
        fnv        => '^1',
        itertools  => '^1',
        quickcheck => '^0.6',
        serde_test => '^1.0.5',
    },
    features => {
        'serde-1'                 => [qw( serde )],
        test_debug                => [],
        test_low_transition_point => [],
    }
);

