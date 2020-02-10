#!perl
use strict;
use warnings;

crate(
    ntest_test_cases => '0.5.1',
    requires         => {
        'proc-macro2' => '^1.0',
        quote         => '^1.0',
        syn           => '^1.0',
    }
);
