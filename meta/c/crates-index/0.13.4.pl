#!perl
use strict;
use warnings;

crate(
    'crates-index' => '0.13.4',
    requires       => {
        'error-chain' => '^0.12',
        git2          => '^0.11',
        glob          => '^0.3',
        home          => '^0.5',
        serde         => '^1',
        serde_derive  => '^1',
        serde_json    => '^1',
    },
    test => {
        tempdir => '^0.3.7',
    }
);
