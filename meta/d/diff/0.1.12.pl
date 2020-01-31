#!perl
use strict;
use warnings;

crate(
    diff => '0.1.12',
    test => {
        quickcheck => '^0.9.0',
        speculate  => '^0.1.2',
    }
);
