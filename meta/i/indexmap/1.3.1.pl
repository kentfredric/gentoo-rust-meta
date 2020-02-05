#!perl
use strict;
use warnings;

crate(
    indexmap       => '1.3.1',
    build_requires => {
        autocfg => '^1',
    },
    optional => {
        rayon => '^1.0',
        serde => '^1.0',
    },
    test => {
        fnv         => '^1.0',
        itertools   => '^0.8',
        lazy_static => '^1.3',
        quickcheck  => '^0.8',
        rand        => '^0.6',
        serde_test  => '^1.0.99',
    },
    features => {
        'serde-1'                 => ['serde'],
        test_debug                => [],
        test_low_transition_point => [],
    }
);
