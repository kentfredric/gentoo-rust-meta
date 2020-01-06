#!perl
use strict;
use warnings;

crate(
    once_cell => '1.2.0',
    optional  => {
        'parking_lot' => '^0.9',
    },
    test => {
        'crossbeam-utils' => '^0.6',

        # removed example
        # lazy_static       => '^1',
        regex => '^1.2.0',
    },
    features => {
        default => [qw( std )],
        std     => [],
    }
);
