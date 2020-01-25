#!perl
use strict;
use warnings;

my %examples = (
    time => '^0.1',

);
crate(
    'parity-wasm' => '0.41.0',

    test => {

    },
    features => {
        atomics  => [],
        bulk     => [],
        default  => [qw( std )],
        std      => [],
        sign_ext => [],
        simd     => [],
    }
);

