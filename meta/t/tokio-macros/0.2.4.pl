#!perl
use strict;
use warnings;

crate(
    'tokio-macros' => '0.2.4',
    requires       => {
        'proc-macro2' => '^1.0.7',
        quote         => '^1',
        syn           => '^1.0.3',
    },
    test => {
        tokio => '^0.2.0',
    },

);
