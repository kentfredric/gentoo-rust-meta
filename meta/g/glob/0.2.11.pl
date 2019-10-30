#!perl
use strict;
use warnings;

crate(
    glob => '0.2.11',
    test => {
        tempdir => '^0.3',
    }
);
