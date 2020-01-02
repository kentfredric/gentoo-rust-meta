#!perl
use strict;
use warnings;

crate(
    quickcheck_macros => '0.8.0',
    requires          => {
        'proc-macro2' => '^0.4.19',
        quote         => '^0.6.8',
        syn           => '^0.15',
    },
    test => {
        quickcheck => '^0.8.0',
    }
);
