#!perl
use strict;
use warnings;

crate(
    'rustc-serialize' => '0.3.24',
    test              => {
        rand => '^0.3'
    }
);

