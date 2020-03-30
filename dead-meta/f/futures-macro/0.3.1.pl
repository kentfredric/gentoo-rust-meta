#!perl
use strict;
use warnings;

crate(
    'futures-macro' => '0.3.1',
    requires        => {
        'proc-macro-hack' => '^0.5.9',
        'proc-macro2'     => '^1',
        quote             => '^1',
        syn               => '^1',
    },

);
