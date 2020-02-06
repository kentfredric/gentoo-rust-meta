#!perl
use strict;
use warnings;

crate(
    phf_macros    => '0.8.0',
    missing_tests => 1,
    requires      => {
        phf_generator     => '^0.8.0',
        phf_shared        => '^0.8.0',
        'proc-macro-hack' => '^0.5.4',
        'proc-macro2'     => '^1',
        quote             => '^1',
        syn               => '^1',
    },
    test => {
        'phf'    => '^0.8',
        trybuild => '^1.0',
        unicase  => '^1.0',
    }
);
