#!perl
use strict;
use warnings;

crate(
    itoa     => '0.4.4',
    features => {
        default => ['std'],
        i128    => [],
        std     => [],
    }
);
