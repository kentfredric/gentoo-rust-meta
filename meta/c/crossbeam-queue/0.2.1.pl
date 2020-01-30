#!perl
use strict;
use warnings;

crate(
    'crossbeam-queue' => '0.2.1',
    requires          => {
        'cfg-if'          => '^0.1.2',
        'crossbeam-utils' => '^0.7',
    },
    test => {
        rand => '^0.6',
    },
    features => {
        alloc   => [qw( crossbeam-utils/alloc )],
        default => [qw( std )],
        std     => [qw( crossbeam-utils/std )],
    }
);
