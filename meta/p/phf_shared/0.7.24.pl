#!perl
use strict;
use warnings;

crate(
    phf_shared => '0.7.24',

    requires => {
        siphasher => '^0.2',
    },
    optional => {
        unicase => '^1.4',
    },
    features => {
        core => [],
    }
);
