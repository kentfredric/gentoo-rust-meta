#!perl
use strict;
use warnings;

crate(
    'generic-array' => '0.13.2',
    requires        => {
        typenum => '^1.10',
    },
    optional => {
        serde => '^1',
    },
    test => {
        bincode    => '^1',
        serde_json => '^1',
    },
    features => {
        more_lengths => [],
    }
);
