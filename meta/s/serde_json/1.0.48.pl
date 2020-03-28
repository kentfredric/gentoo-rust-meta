#!perl
use strict;
use warnings;

my %stripped = (
    test => {
        automod       => '^0.1',
        rustversion   => '^1.0',
        serde_bytes   => '^0.11',
        serde_derive  => '^1.0',
        serde_stacker => '^0.1',
        trybuild      => '^1.0.19',
    }
);
crate(
    serde_json => '1.0.48',
    requires   => {
        itoa  => '^0.4.3',
        ryu   => '^1',
        serde => '^1.0.100',
    },
    optional => {
        indexmap => '^1.2',
    },
    features => {
        alloc               => [qw( serde/alloc )],
        arbitrary_precision => [],
        default             => [qw( std )],
        preserve_order      => ['indexmap'],
        raw_value           => [],
        std                 => [qw( serde/std )],
        unbounded_depth     => [],
    },
);
