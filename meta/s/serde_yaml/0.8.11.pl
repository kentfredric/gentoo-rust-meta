#!perl
use strict;
use warnings;

crate(
    # TODO
    serde_yaml => '0.8.11',
    requires   => {
        dtoa              => '^0.4',
        'linked-hash-map' => '^0.5',
        serde             => '^1.0.60',
        'yaml-rust'       => '^0.4',
    },
    test => {
        serde_derive => '^1',
        unindent     => '^0.1',
    }
);
