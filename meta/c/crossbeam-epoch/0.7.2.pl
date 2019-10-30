#!perl
use strict;
use warnings;

crate(
    'crossbeam-epoch' => '0.7.2',
    requires          => {
        arrayvec          => '^0.4',
        'cfg-if'          => '^0.1.2',
        'crossbeam-utils' => '^0.6',
        memoffset         => '^0.5',
        scopeguard        => '^1',
    },
    optional => {
        lazy_static => '^1',
    },
    test => {
        rand => '^0.6',
    },
    features => {
        alloc   => [qw( crossbeam-utils/alloc )],
        default => [qw( std )],

        # nightly => [qw( crossbeam-utils/nightly arrayvec/use_union )],
        sanitize => [],
        std      => [qw( crossbeam-utils/std lazy_static )],
    }
);
