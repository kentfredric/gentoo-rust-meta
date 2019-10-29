#!perl
use strict;
use warnings;

crate(
    ci_info  => '0.3.1',
    optional => {
        serde        => '^1',
        serde_derive => '^1',
    },
    features => {
        'serde-1' => [ 'serde', 'serde_derive' ],
    }
);
