#!perl
use strict;
use warnings;

crate(
    average  => '0.10.4',
    requires => {
        conv         => '^0.3.2',
        'float-ord'  => '^0.2',
        'num-traits' => '^0.2',
    },
    optional => {
        serde             => '^1',
        'serde-big-array' => '^0.2.0',
        serde_derive      => '^1',
    },
    test => {

        # bencher => '^0.1' # benchmarks
        proptest          => '^0.9',
        quantiles         => '^0.7',
        rand              => '^0.7',
        rand_distr        => '^0.2.1',
        rand_xoshiro      => '^0.4',
        serde_json        => '^1',
        'streaming-stats' => '^0.2',
    },
    features => {
        serde1 => [qw( serde serde_derive serde-big-array )],
    }
);
