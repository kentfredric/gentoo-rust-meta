#!perl
use strict;
use warnings;

my %examples = ( lazy_static => '^1', );
crate(
    once_cell => '1.3.1',
    optional  => {
        'parking_lot' => '^0.9',
    },
    test => {
        'crossbeam-utils' => '^0.6',
        regex             => '^1.2.0',
    },
    features => {
        default => [qw( std )],
        std     => [],
    }
);
