#!perl
use strict;
use warnings;

crate(
    'demo-hack-impl' => '0.0.5',
    requires         => {
        'proc-macro-hack' => '^0.5',
        quote             => '^0.6',
        syn               => '^0.15',
    }
);
