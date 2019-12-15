#!perl
use strict;
use warnings;

crate(
    toml     => '0.4.10',
    requires => {
        serde => '^1',
    },
    test => {
        serde_derive => '^1',
    },
);
