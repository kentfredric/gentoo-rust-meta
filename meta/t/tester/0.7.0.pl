#!perl
use strict;
use warnings;

crate(
    tester   => '0.7.0',
    requires => {
        getopts => '^0.2',
        libc    => '^0.2',
        term    => '^0.6',
    },
    features => {
        asm_black_box => [],
        capture       => [],
    }
);
