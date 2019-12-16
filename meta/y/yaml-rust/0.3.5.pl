#!perl
use strict;
use warnings;

crate(
    'yaml-rust' => '0.3.5',
    optional    => {
        'linked-hash-map' => '>=0.0.9, <0.4',
    },
    features => {
        'preserve_order' => [qw( linked-hash-map )],
    }
);
