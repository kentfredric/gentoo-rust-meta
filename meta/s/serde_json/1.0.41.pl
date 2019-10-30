#!perl
use strict;
use warnings;

crate(
    serde_json => '1.0.41',
    requires   => {
        itoa  => '^0.4.3',
        ryu   => '^1',
        serde => '^1.0.60',
    },
    optional => {
        indexmap => '^1',
    },
    features => {
        arbitrary_precision => [],
        default             => [],
        preserve_order      => ['indexmap'],
        raw_value           => [],
        unbounded_depth     => [],
    },
);
