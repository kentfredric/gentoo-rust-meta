#!perl
use strict;
use warnings;

crate(
    ron      => '0.4.1',
    requires => {
        base64   => '^0.10',
        bitflags => '^1',
        serde    => '^1',
    },
    test => {
        serde_bytes => '^0.10',
        serde_json  => '^1',
    },
);

