#!perl
use strict;
use warnings;

crate(
    scopeguard => '1.0.0',
    features   => {
        default => ['use_std'],
        use_std => [],
    }
);
