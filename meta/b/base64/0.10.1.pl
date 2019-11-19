#!perl
use strict;
use warnings;

crate(
    base64   => '0.10.1',
    requires => {
        byteorder => '^1.2.6',
    },
    test => {

        # criterion => '^0.2', # benches
        rand => '^0.6.1',
    }
);
