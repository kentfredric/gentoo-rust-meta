#!perl
use strict;
use warnings;

crate(
    expectest => '0.9.2',
    requires  => {
        'num-traits' => '^0.1.40',
    },
    features => {
        nightly => [],
    }
);
