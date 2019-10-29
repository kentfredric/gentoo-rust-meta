#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests Restricted, features missing
    toml            => '0.5.3',
    missing_tests   => 1,
    missing_options => 1,
    optional        => {
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
