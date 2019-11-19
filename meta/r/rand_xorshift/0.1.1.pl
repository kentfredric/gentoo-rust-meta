#!perl
use strict;
use warnings;

crate(
    rand_xorshift => '0.1.1',
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
