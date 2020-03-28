#!perl
use strict;
use warnings;

crate(
    toml     => '0.5.6',
    optional => {
        indexmap => '^1.0',
    },
    requires => {
        serde => '^1.0.97',
    },
    test => {
        serde_derive => '^1',
        serde_json   => '^1',
    },
    features => {
        default        => [],
        preserve_order => ['indexmap'],
    }
);
