#!perl
use strict;
use warnings;

crate(
    rand_chacha => '0.1.1',
    requires    => {
        rand_core => '>=0.2, <0.4',
    },
    build_requires => {
        autocfg => '^0.1',
    }
);
