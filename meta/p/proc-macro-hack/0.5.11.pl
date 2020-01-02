#!perl
use strict;
use warnings;

crate(
    'proc-macro-hack' => '0.5.11',
    requires          => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1.0.5',
    },
    test => {
        'demo-hack'      => '^0.0.5',
        'demo-hack-impl' => '^0.0.5',
    },
);

