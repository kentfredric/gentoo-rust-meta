#!perl
use strict;
use warnings;

crate(
    'no-panic' => '0.1.12',
    requires   => {
        'proc-macro2' => '^1.0',
        quote         => '^1.0',
        syn           => '^1.0',
    },
    test => {
        tempfile => '^3',
    }
);
