#!perl
use strict;
use warnings;

crate(
    'erased-serde' => '0.3.10',
    requires       => {
        serde => '^1.0.63',
    },
    test => {
        serde_cbor   => '^0.9',
        serde_derive => '^1',
        serde_json   => '^1',
    },
    features => {
        'unstable-debug' => [],

    }
);
