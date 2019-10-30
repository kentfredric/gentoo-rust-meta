#!perl
use strict;
use warnings;

crate(
    'crossbeam-queue' => '0.1.2',
    requires          => {
        'crossbeam-utils' => '^0.6.5',
    },
    test => {
        rand => '^0.6',
    }
);
