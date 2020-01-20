#!perl
use strict;
use warnings;

crate(
    spmc => '0.3.0',
    test => {
        loom => '^0.2.2',
    }
);
