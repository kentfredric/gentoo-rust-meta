#!perl
use strict;
use warnings;

crate(
    arrayvec => '0.5.1',

    requires => {},
    optional => {
        serde => '^1',
    },
    test => {

        # bencher    => '^0.1.4', # benchmarks
        matches    => '^0.1',
        serde_test => '^1',
    },
    features => {
        'array-sizes-129-255' => [],
        'array-sizes-33-128'  => [],
        default               => [qw( std )],
        std                   => [],
    }
);
