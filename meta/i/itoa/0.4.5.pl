#!perl
use strict;
use warnings;

crate(
    itoa     => '0.4.5',
    features => {
        default => ['std'],
        i128    => [],
        std     => [],
    }
);
