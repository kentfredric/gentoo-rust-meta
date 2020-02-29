#!perl
use strict;
use warnings;

crate(
    scopeguard => '1.1.0',
    features   => {
        default => ['use_std'],
        use_std => [],
    }
);
