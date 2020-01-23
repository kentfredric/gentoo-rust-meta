#!perl
use strict;
use warnings;

crate(
    serde_urlencoded => '0.6.1',
    requires         => {
        dtoa  => '^0.4.0',
        itoa  => '^0.4.0',
        serde => '^1.0.0',
        url   => '^2.0.0',
    },
    test => {
        serde_derive => '^1.0',
    }
);
