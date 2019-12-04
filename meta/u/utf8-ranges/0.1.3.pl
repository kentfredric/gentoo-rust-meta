#!perl
use strict;
use warnings;

crate(
    'utf8-ranges' => '0.1.3',
    test          => {
        quickcheck => '^0.2',
    }
);
