#!perl
use strict;
use warnings;

crate(
    'tracing-attributes' => '0.1.6',
    requires             => {
        quote => '^1',
        syn   => '^1',
    },
    test => {
        tracing           => '^0.1',
        'tracing-futures' => '^0.2',
    },
    features => {
        'async-await' => [],
    }
);
