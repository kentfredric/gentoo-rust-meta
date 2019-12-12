#!perl
use strict;
use warnings;

crate(
    'unicode-segmentation' => '1.6.0',
    test                   => {
        'quickcheck' => '^0.7',
    },
    features => {
        no_std => [],
    }
);
