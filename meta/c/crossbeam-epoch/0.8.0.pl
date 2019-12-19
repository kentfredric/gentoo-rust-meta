#!perl
use strict;
use warnings;

crate(
    'crossbeam-epoch' => '0.8.0',
    requires          => {
        'cfg-if'          => '^0.1.2',
        'crossbeam-utils' => '^0.7',
        memoffset         => '^0.5',
        scopeguard        => '^1',
    },
    optional => {
        lazy_static => '^1',
    },
    test => {
        rand => '^0.6',
    },
    build_requires => {
        autocfg => '^0.1.6',
    },
    features => {
        alloc    => [qw( crossbeam-utils/alloc )],
        default  => [qw( std )],
        nightly  => [qw( crossbeam-utils/nightly )],
        sanitize => [],
        std      => [qw( crossbeam-utils/std lazy_static )],
    }
);
