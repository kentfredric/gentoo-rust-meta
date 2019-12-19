#!perl
use strict;
use warnings;

crate(
    'crossbeam-queue' => '0.2.0',
    requires          => {
        'crossbeam-utils' => '^0.7',
    },
    test => {
        rand => '^0.6',
    }
);
