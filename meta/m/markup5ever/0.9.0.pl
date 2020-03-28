#!perl
use strict;
use warnings;

crate(
    markup5ever => '0.9.0',
    requires    => {
        log          => '^0.4',
        phf          => '^0.7',
        string_cache => '^0.7',
        tendril      => '^0.4',
    },
    build_requires => {
        phf_codegen          => '^0.7.3',
        serde                => '^1.0',
        serde_derive         => '^1.0',
        serde_json           => '^1.0',
        string_cache_codegen => '^0.4',
    }
);
