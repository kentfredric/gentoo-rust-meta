#!perl
use strict;
use warnings;

crate(
    cexpr    => '0.3.6',
    requires => {
        nom => '^4',
    },
    test => {
        'clang-sys' => '>=0.13.0, <0.29.0',
    }
);
