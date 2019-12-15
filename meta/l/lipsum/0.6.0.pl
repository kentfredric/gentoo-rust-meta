#!perl
use strict;
use warnings;

crate(
    lipsum   => '0.6.0',
    requires => {
        rand => '^0.6',
    },
    test => {
        'rand_xorshift' => '^0.1',
        'version-sync'  => '^0.6',
    }
);
