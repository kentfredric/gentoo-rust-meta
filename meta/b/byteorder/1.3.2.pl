#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    byteorder     => '1.3.2',
    missing_tests => 1,
    test          => {
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
