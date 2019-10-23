#!perl
use strict;
use warnings;

crate(
    serde_derive => '1.0.89',
    requires     => {
        'proc-macro2' => '^0.4',
        quote         => '^0.6.3',
        syn           => '^0.15.22',
    },
    test => {
        serde => '^1',
    },
    features => {
        default              => [],
        deserialize_in_place => [],
    }
);
