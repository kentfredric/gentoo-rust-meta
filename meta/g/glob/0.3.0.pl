#!perl
use strict;
use warnings;

crate(
    glob => '0.3.0',
    test => {
        tempdir => '^0.3',
    },
);
