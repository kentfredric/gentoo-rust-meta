#!perl
use strict;
use warnings;

crate(
    lazy_static => '1.4.0',
    optional    => {
        spin => '^0.5',
    },
    test => {
        'doc-comment' => '^0.3.1',
    },
    features => {
        spin_no_std => ['spin'],
    },
);
