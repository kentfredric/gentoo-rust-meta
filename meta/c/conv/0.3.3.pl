#!perl
use strict;
use warnings;

crate(
    conv          => '0.3.3',
    missing_tests => 1,
    requires      => {
        custom_derive => '^0.1.2',
    },
    test => {
        quickcheck => '^0.2.21, <0.2.25',
    }
);

