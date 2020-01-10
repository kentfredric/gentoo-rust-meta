#!perl
use strict;
use warnings;

crate(
    ntest    => '0.3.3',
    requires => {
        ntest_test_cases => '^0.3.3',
        ntest_timeout    => '^0.3.3',
        timebomb         => '^0.1.2',
    },
    test => {
        ntest_test_cases => '^0.3.3',
        ntest_timeout    => '^0.3.3',
        timebomb         => '^0.1.2',
    }
);
