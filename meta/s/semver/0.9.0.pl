#!perl
use strict;
use warnings;

crate(
    semver   => '0.9.0',
    requires => {
        'semver-parser' => '^0.7',
    },
    optional => {
        'serde' => '^1.0',
    },
    test => {

        'crates-index' => '^0.5',
        serde_json     => '^1',
        serde_derive   => '^1',
        tempdir        => '^0.3.4',
    },
    features => {
        default => [],
        ci      => ['serde'],
    },
);
