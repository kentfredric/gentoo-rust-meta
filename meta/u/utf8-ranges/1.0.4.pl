#!perl
use strict;
use warnings;

crate(
    'utf8-ranges' => '1.0.4',
    test          => {
        'doc-comment' => '^0.3',
        quickcheck    => '^0.8',
    }
);
