#!perl
use strict;
use warnings;

crate(
    # TODO
    'yaml-rust'   => '0.4.3',
    missing_tests => 1,
    requires      => {
        'linked-hash-map' => '>0.0.9, <=0.6',
    },
    test => {
        quickcheck => '^0.7',
    }
);
