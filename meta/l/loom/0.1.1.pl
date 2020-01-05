#!perl
use strict;
use warnings;

crate(
    loom     => '0.1.1',
    requires => {
        'cfg-if'     => '^0.1.6',
        'scoped-tls' => '^0.1.2',
    },
    optional => {
        futures      => '^0.1.25',
        generator    => '^0.6.10',
        serde        => '^1.0.80',
        serde_derive => '^1.0.80',
        serde_json   => '^1.0.33',
    },
    features => {
        checkpoint => [qw( serde serde_derive serde_json )],
        default    => [],
    }
);

