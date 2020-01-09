#!perl
use strict;
use warnings;

crate(
    'bytes'  => '0.5.3',
    optional => {
        serde => '^1.0',
    },
    test => {
        loom       => '^0.2.10',
        serde_test => '^1.0',
    },
    features => {
        default => [qw( std )],
        std     => [],
    }
);
