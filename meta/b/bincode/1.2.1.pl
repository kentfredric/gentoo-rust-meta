#!perl
use strict;
use warnings;

crate(
    bincode  => '1.2.1',
    requires => {
        byteorder => '^1.3',
        serde     => '^1.0.63',
    },
    test => {
        serde_bytes  => '^0.11',
        serde_derive => '^1.0.27',
    },
    features => {
        i128 => [],
    }
);
