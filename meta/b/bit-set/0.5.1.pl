#!perl
use strict;
use warnings;

crate(
    'bit-set' => '0.5.1',
    requires  => {
        'bit-vec' => '^0.5.0',
    },
    test => {
        rand => '^0.3',
    },
    features => {
        default => [qw( std )],
        nightly => [qw( bit-vec/nightly )],
        std     => [qw( bit-vec/std )],
    }
);
