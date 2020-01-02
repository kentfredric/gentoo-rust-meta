#!perl
use strict;
use warnings;

crate(
    'version-sync' => '0.8.1',
    requires       => {
        itertools        => '^0.8',
        'proc-macro2'    => '^0.4',
        'pulldown-cmark' => '^0.4',
        regex            => '^1.1',
        'semver-parser'  => '^0.9',
        syn              => '^0.15',
        toml             => '^0.5',
        url              => '^1',
    }
);
