#!perl
use strict;
use warnings;

crate(
    # TODO
    'aho-corasick' => '0.7.6',
    requires       => {
        memchr => '^2.2.0',
    },
    test => {
        'doc-comment' => '^0.3.1',
    },
    features => {
        default => ['std'],
        std     => ['memchr/use_std'],
    },
);
