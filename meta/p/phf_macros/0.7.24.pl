#!perl
use strict;
use warnings;

crate(
    phf_macros => '0.7.24',
    requires   => {
        phf_generator => '^0.7.24',
        phf_shared    => '^0.7.24',
        'proc-macro2' => '^0.4',
        quote         => '^0.6',
        syn           => '^0.15',
    },
    test => {
        compiletest_rs => '^0.3',
    }
);
