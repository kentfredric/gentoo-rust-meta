#!perl
use strict;
use warnings;

crate(
    phf_codegen => '0.7.24',
    requires    => {
        phf_generator => '^0.7.24',
        phf_shared    => '^0.7.24',
    }
);
