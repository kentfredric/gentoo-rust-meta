#!perl
use strict;
use warnings;

crate(
    rand_xoshiro => '0.1.0',
    requires     => {
        byteorder => '^1',
        rand_core => '^0.3',
    },
    test => {
        rand => '^0.6',
    }
);
