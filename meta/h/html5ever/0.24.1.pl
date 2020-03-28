#!perl
use strict;
use warnings;

crate(
    html5ever => '0.24.1',
    requires  => {
        log         => '^0.4',
        mac         => '^0.1',
        markup5ever => '^0.9',
    },
    test => {
        'rustc-test' => '^0.3',
        serde_json   => '^1.0',
    },
    build_requires => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1',
    }
);
