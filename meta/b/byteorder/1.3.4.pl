#!perl
use strict;
use warnings;

crate(
    byteorder => '1.3.4',
    test      => {
        'doc-comment' => '^0.3',
        quickcheck    => '^0.8',
        rand          => '^0.6',
    },
    features => {
        default => ['std'],
        i128    => [],
        std     => [],
    }
);
