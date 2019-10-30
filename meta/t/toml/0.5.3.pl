#!perl
use strict;
use warnings;

crate(
    toml     => '0.5.3',
    optional => {
        'linked-hash-map' => '^0.5',
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
        preserve_order => ['linked-hash-map'],
    }
);
