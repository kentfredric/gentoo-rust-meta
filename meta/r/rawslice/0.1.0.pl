#!perl
use strict;
use warnings;

crate(
    rawslice => '0.1.0',
    requires => {
        rawpointer => '^0.1',
    },
    test => {
        quickcheck => '^0.4',
    },
);

