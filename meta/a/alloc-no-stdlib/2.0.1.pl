#!perl
use strict;
use warnings;

crate(
    'alloc-no-stdlib' => '2.0.1',
    features          => {
        unsafe => [],
    }
);
