#!perl
use strict;
use warnings;

crate(
    difference => '2.0.0',
    optional   => {
        getopts => '^0.2',
    },
    test => {
        quickcheck => '^0.4',
        term       => '^0.2.7',
    },
    features => {
        bin     => ['getopts'],
        default => [],
    },
);
