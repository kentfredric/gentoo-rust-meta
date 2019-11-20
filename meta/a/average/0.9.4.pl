#!perl
use strict;
use warnings;

crate(
    average         => '0.9.4',
    missing_tests   => 1,
    missing_options => 1,
    requires        => {
        conv          => '^0.3',
        'float-ord'   => '^0.2',
        'num-integer' => '^0.1',
        'num-traits'  => '^0.2',
    },
    optional => {
        serde             => '^1',
        'serde-big-array' => '^0.1.4',
        serde_derive      => '^1',
    },
    test => {

        # bencher => '^0.1' # benchmarks
        quantiles         => '^0.7',
        rand              => '^0.6',
        serde_json        => '^1',
        'streaming-stats' => '^0.2',
    },
    features => {
        serde1 => [qw( serde serde_derive serde-big-array )],
    }
);
