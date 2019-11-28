#!perl
use strict;
use warnings;

crate(
    base64   => '0.9.3',
    requires => {
        byteorder => '^1.1.0',
        safemem   => '^0.3',
    },
    test => {
        rand => '^0.4',
    }
);
