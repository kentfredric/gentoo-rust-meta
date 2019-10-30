#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    rand_isaac    => '0.1.1',
    missing_tests => 1,
    requires      => {
        rand_core => '^0.3',
    },
    optional => {
        serde        => '^1',
        serde_derive => '^1',
    },
    test => {
        bincode => '^1'
    },
    features => {
        serde1 => [ 'serde', 'serde_derive', 'rand_core/serde1' ],
    }
);
