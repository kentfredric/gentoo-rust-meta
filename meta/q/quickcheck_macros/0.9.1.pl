#!perl
use strict;
use warnings;

crate(
    quickcheck_macros => '0.9.1',
    requires          => {
        'proc-macro2' => '^1.0',
        quote         => '^1.0',
        syn           => '^1.0',
    },
    test => {
        quickcheck => '^0.9.0',
    }
);
