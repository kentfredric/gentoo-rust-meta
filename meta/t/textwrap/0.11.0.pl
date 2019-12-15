#!perl
use strict;
use warnings;

crate(
    textwrap => '0.11.0',
    optional => {
        hyphenation => '^0.7.1',
        term_size   => '^0.3.0',
    },
    requires => {
        'unicode-width' => '^0.1.3',
    },
    test => {

        # lipsum         => '^0.6', # benchmark
        #  rand           => '^0.6', # benchmark
        #  rand_xorshift  => '^0.1', # benchmark
        'version-sync' => '^0.6',

    }
);
