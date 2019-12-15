#!perl
use strict;
use warnings;

crate(
    'version-sync' => '0.6.0',
    requires       => {
        itertools        => '^0.7',
        lazy_static      => '~1.1',
        'pulldown-cmark' => '^0.1',
        regex            => '^1.0',
        'semver-parser'  => '^0.9',
        syn              => '^0.15',
        toml             => '^0.4',
        url              => '^1.5.1',
    }
);
