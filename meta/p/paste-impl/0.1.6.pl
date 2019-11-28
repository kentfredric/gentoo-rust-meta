#!perl
use strict;
use warnings;

crate(
    'paste-impl' => '0.1.6',
    requires     => {
        'proc-macro-hack' => '^0.5',
        'proc-macro2'     => '^1',
        quote             => '^1',
        syn               => '^1',
    }
);
