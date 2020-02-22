#!perl
use strict;
use warnings;

crate(
    'alloc-stdlib' => '0.2.1',
    requires       => {
        'alloc-no-stdlib' => '~2.0',
    },
    features => {
        unsafe => [],
    }
);
