#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests Restricted
    rand_xorshift => '0.1.1',
    missing_tests => 1,
    requires      => {
        rand_core => '>0.2, <=0.4.0',
    },
    optional => {
        serde        => '^1',
        serde_derive => '^1.0.38',
    },
    test => {
        bincode => '^1',
    },
    features => {
        serde1 => [qw( serde serde_derive )],
    },
);
