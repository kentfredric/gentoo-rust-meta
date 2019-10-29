#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests Restricted, Missing feaures
    serde_json      => '1.0.41',
    missing_tests   => 1,
    missing_options => 1,
    requires        => {
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
