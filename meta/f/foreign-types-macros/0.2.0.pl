#!perl
use strict;
use warnings;

crate(
    'foreign-types-macros' => '0.2.0',
    requires               => {
        'proc-macro2' => '^1.0',
        quote         => '^1.0',
        syn           => '^1.0',
    },
    features => {
        std => [],
    }
);
