#!perl
use strict;
use warnings;

crate(
    bincode  => '1.2.0',
    requires => {
        byteorder => '^1.3',
        serde     => '^1.0.63',
    },
    test => {
        serde_bytes  => '^0.11',
        serde_derive => '^1.0.27',
    },
    build_requires => {
        autocfg => "^0.1.2",
    },
    features => {
        i128 => [],
    }
);
