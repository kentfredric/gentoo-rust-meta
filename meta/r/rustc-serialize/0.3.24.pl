#!perl
use strict;
use warnings;

crate(
    # TODO
    'rustc-serialize' => '0.3.24',
    missing_tests     => 1,
    test              => {
        rand => '^0.3'
    }
);

