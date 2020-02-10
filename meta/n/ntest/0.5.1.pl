#!perl
use strict;
use warnings;

crate(
    ntest    => '0.5.1',
    requires => {
        ntest_test_cases => '^0.5.1',
        ntest_timeout    => '^0.5.1',
    },
    test => {
        ntest_test_cases => '^0.5.1',
        ntest_timeout    => '^0.5.1',
    }
);
