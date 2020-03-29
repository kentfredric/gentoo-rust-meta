#!perl
use strict;
use warnings;

crate(
    ci_info  => '0.9.2',
    requires => {
        envmnt => '^0.8',
    },
    optional => {
        serde        => '^1',
        serde_derive => '^1',
    },
    test => {
        lazy_static => '^1',
    },
    features => {
        'serde-1' => [ 'serde', 'serde_derive' ],
    }
);
