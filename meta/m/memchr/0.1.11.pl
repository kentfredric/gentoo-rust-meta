#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests Restricted
    memchr        => '0.1.11',
    missing_tests => 1,
    requires      => {
        libc => '^0.2.4',
    },
    test => {
        quickcheck => '^0.2',
    },
);
