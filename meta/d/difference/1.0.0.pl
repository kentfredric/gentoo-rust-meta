#!perl
use strict;
use warnings;

crate(
    difference => '1.0.0',
    optional   => {
        getopts => '^0.2',
    },
    test => {
        term => '^0.2.7',
    },
    features => {
        bin     => ['getopts'],
        default => [],
    },
);
