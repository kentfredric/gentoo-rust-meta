#!perl
use strict;
use warnings;

crate(
    quickcheck => '0.2.24',
    requires   => {
        log  => '^0.3',
        rand => '^0.3',
    }
);
