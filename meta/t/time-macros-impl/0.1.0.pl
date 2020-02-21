#!perl
use strict;
use warnings;

crate(
    'time-macros-impl' => '0.1.0',
    requires           => {
        'proc-macro-hack' => '^0.5',
        'proc-macro2'     => '^1',
        quote             => '^1',
        syn               => '^1',
    }
);
