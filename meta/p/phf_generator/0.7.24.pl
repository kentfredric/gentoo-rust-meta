#!perl
use strict;
use warnings;

crate(
    phf_generator => '0.7.24',
    requires      => {
        phf_shared => '^0.7.24',
        rand       => '^0.6',
    }
);
