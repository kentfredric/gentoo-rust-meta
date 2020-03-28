#!perl
use strict;
use warnings;

crate(
    'serde-big-array' => '0.2.0',
    requires          => {
        serde_derive => '^1',
        serde        => '^1',
    },
    test => {
        serde_json => '^1',
    },
    features => {
        'const-generics' => [],
    }
);
