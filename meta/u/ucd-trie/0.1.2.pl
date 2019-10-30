#!perl
use strict;
use warnings;

crate(
    'ucd-trie' => '0.1.2',
    test       => {
        lazy_static => '^1',
    },
    features => {
        default => ['std'],
        std     => [],
    },
);
