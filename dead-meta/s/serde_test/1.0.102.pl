#!perl
use strict;
use warnings;

crate(
    serde_test => '1.0.102',
    requires   => {
        serde => '^1.0.60',
    },
    test => {
        serde        => '^1.0',
        serde_derive => '^1.0',
    }
);
