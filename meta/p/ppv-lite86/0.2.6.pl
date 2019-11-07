#!perl
use strict;
use warnings;

crate(
    'ppv-lite86' => '0.2.6',
    features     => {
        std     => [],
        simd    => [],
        default => [qw[ std simd ]]
    }
);
