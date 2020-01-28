#!perl
use strict;
use warnings;

crate(
    rand_distr    => '0.2.2',
    missing_tests => 1,
    requires      => {
        rand => '^0.7',
    },
    test => {
        average  => '^0.10.3',
        rand_pcg => '^0.2',
    }
);
