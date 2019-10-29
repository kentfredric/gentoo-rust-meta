#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests Restricted, Features, Binaries missing.
    difference      => '2.0.0',
    missing_tests   => 1,
    missing_options => 1,
    optional        => {
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
