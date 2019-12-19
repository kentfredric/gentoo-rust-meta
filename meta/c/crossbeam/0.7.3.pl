#!perl
use strict;
use warnings;

crate(
    crossbeam => '0.7.3',
    requires  => {
        'cfg-if'          => '^0.1.2',
        'crossbeam-epoch' => '^0.8',
        'crossbeam-utils' => '^0.7',
    },
    optional => {
        'crossbeam-channel' => '^0.4',
        'crossbeam-deque'   => '^0.7.0',
        'crossbeam-queue'   => '^0.2',
    },
    test => {
        rand => '^0.6',
    },
    features => {
        alloc   => [qw( crossbeam-epoch/alloc crossbeam-utils/alloc )],
        default => [qw( std )],
        nightly => [qw( crossbeam-epoch/nightly crossbeam-utils/nightly )],
        std     => [
            qw( crossbeam-channel crossbeam-deque crossbeam-epoch/std crossbeam-queue crossbeam-utils/std )
        ],
    }
);
