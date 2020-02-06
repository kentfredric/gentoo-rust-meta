#!perl
use strict;
use warnings;

crate(
    string_cache_codegen => '0.5.1',
    requires             => {
        phf_generator => '^0.8',
        phf_shared    => '^0.8',
        'proc-macro2' => '^1',
        quote         => '^1',
    }
);
