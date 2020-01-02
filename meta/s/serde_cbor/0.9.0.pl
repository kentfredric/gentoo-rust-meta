#!perl
use strict;
use warnings;

crate(
    serde_cbor => '0.9.0',

    requires => {
        byteorder => '^1.0.0',
        half      => '^1.1.2',
        serde     => '^1.0.14',
    },
    test => {
        serde_bytes  => '^0.10',
        serde_derive => '^1.0.14',
    }
);
