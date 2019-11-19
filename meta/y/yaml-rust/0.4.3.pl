#!perl
use strict;
use warnings;

crate(
    'yaml-rust' => '0.4.3',
    requires    => {
        'linked-hash-map' => '>0.0.9, <=0.6',
    },
    test => {
        quickcheck => '^0.7',
    }
);
