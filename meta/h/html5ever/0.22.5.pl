#!perl
use strict;
use warnings;

crate(
    html5ever => '0.22.5',
    requires  => {
        log         => '^0.4',
        mac         => '^0.1',
        markup5ever => '^0.7',
    },
    test => {
        'rustc-serialize' => '^0.3.15',
        'rustc-test'      => '^0.3',
    },
    build_requires => {
        'proc-macro2' => '^0.4',
        'quote'       => '^0.6',
    }
);
