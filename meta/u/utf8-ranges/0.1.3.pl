#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests Restricted
    'utf8-ranges' => '0.1.3',
    missing_tests => 1,
    test          => {
        quickcheck => '^0.2',
    }
);
