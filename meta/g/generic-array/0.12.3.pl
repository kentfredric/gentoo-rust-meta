#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    'generic-array' => '0.12.3',
    missing_tests   => 1,
    requires        => {
        typenum => '^1.10',
    },
    optional => {
        serde => '^1',
    },
    test => {
        bincode    => '^1',
        serde_json => '^1',
    },
);
