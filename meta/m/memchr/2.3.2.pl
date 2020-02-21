#!perl
use strict;
use warnings;

crate(
    memchr   => '2.3.2',
    optional => {
        libc => '^0.2.18',
    },
    test => {
        quickcheck => '^0.9',
    },
    features => {
        default => [qw( std )],
        std     => [],
        use_std => [qw( std )]
    },
);
