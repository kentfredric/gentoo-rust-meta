#!perl
use strict;
use warnings;

crate(
    tendril  => '0.4.1',
    optional => {
        encoding    => '^0.2',
        encoding_rs => '^0.8.12',
    },
    requires => {
        futf    => '^0.1.1',
        mac     => '^0.1',
        'utf-8' => '^0.7',
    },
    test => {
        rand => '^0.4',
    }
);
