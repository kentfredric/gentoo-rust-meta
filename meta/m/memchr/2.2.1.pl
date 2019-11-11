#!perl
use strict;
use warnings;

crate(
    memchr   => '2.2.1',
    optional => {
        libc => '^0.2.18',
    },
    test => {
        quickcheck => '^0.8',
    },
    features => {
        default => ['use_std'],
        use_std => [],
    },
);
