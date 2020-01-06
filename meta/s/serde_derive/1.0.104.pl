#!perl
use strict;
use warnings;

crate(
    serde_derive => '1.0.104',
    requires     => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1',
    },
    test => {
        serde => '^1',
    },
    features => {
        default              => [],
        deserialize_in_place => [],
    }
);
