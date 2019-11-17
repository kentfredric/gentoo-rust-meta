#!perl
use strict;
use warnings;

crate(
    'parity-wasm' => '0.38.0',
    test          => {

        # time => '^0.1', # example
    },
    features => {
        default => [qw( std )],
        std     => [],
    }
);

