#!perl
use strict;
use warnings;

crate(
    'crossbeam-utils' => '0.6.6',
    requires          => {
        'cfg-if' => '^0.1.2',
    },
    optional => {
        lazy_static => '^1.1',
    },
    test => {
        rand => '^0.6',
    },
    features => {
        alloc   => [],
        default => [qw( std )],

        # nightly => [],
        std => [qw( lazy_static )],
    }
);
