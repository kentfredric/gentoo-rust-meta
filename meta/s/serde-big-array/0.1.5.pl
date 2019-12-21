#!perl
use strict;
use warnings;

crate(
    'serde-big-array' => '0.1.5',
    requires          => {
        serde_derive => '^1',
        serde        => '^1',
    },
    test => {
        serde_json => '^1',
    }
);
