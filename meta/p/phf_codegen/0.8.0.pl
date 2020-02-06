#!perl
use strict;
use warnings;

crate(
    phf_codegen => '0.8.0',
    requires    => {
        phf_generator => '^0.8',
        phf_shared    => '^0.8',
    }
);
