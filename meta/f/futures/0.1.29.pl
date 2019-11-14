#!perl
use strict;
use warnings;

crate(
    futures  => '0.1.29',
    features => {
        default           => [qw( use_std with-deprecated )],
        nightly           => [],
        use_std           => [],
        'with-deprecated' => [],
    }
);
