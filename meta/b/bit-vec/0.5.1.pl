#!perl
use strict;
use warnings;

crate(
    'bit-vec' => '0.5.1',
    test      => {
        rand => '^0.3.15',
    },
    features => {
        default => [qw( std )],

        # nightly => [],
        std => [],
    }
);
