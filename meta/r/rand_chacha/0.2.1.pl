#!perl
use strict;
use warnings;

crate(
    rand_chacha => '0.2.1',
    requires    => {
        'c2-chacha' => '^0.2.2',
        rand_core   => '^0.5',
    },
    features => {
        default => [qw[ std simd ]],
        simd    => [],
        std     => [qw[ c2-chacha/std ]],

    }
);
