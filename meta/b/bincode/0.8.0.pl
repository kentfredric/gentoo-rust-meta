#!perl
use strict;
use warnings;

crate(
    bincode  => '0.8.0',
    requires => {
        byteorder    => '^1',
        'num-traits' => '^0.1.32',
        serde        => '^1',
    },
    test => {
        serde_bytes  => '^0.10',
        serde_derive => '^1',
    }
);
