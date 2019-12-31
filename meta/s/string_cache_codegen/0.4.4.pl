#!perl
use strict;
use warnings;

crate(
    string_cache_codegen => '0.4.4',
    requires             => {
        phf_generator       => '^0.7.15',
        phf_shared          => '^0.7.4',
        'proc-macro2'       => '^1',
        quote               => '^1',
        string_cache_shared => '^0.3',
    }
);
