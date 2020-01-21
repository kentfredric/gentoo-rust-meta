#!perl
use strict;
use warnings;

# 0.3.0-alpha.19 / 0.3.0_alpha19
crate(
    'futures-select-macro-preview' => '0.3.0.19',
    requires                       => {
        'proc-macro-hack' => '^0.5.9',
        'proc-macro2'     => '^1',
        quote             => '^1',
        syn               => '^1',
    },
    features => {
        std => [],
    }
);
