#!perl
use strict;
use warnings;

crate(
    sha1          => '0.6.0',
    missing_tests => 1,
    optional      => {
        serde => '^1.0',
    },
    test => {
        openssl    => '^0.10',
        rand       => '^0.4',
        serde_json => '^1.0',
    },
    features => {
        std => [],
    },
);
