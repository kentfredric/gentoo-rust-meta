#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests Restricted
    'regex-syntax' => '0.3.9',
    missing_tests  => 1,
    test           => {
        quickcheck => '^0.2',
        rand       => '^0.3',
    }
);

