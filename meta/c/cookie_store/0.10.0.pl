#!perl
use strict;
use warnings;

crate(
    cookie_store => '0.10.0',
    requires     => {
        cookie       => '^0.12.0',
        idna         => '^0.2',
        log          => '^0.4.8',
        publicsuffix => '^1.5.3',
        serde        => '^1.0.99',
        serde_json   => '^1.0.40',
        time         => '^0.1.42',
        url          => '^2.1.0',
    },
    optional => {
        indexmap => '^1.2.0',
    },
    test => {
        env_logger        => '^0.6.2',
        pretty_assertions => '^0.6.1',
    },
    features => {
        default        => [],
        preserve_order => [qw( indexmap )],
    }
);
