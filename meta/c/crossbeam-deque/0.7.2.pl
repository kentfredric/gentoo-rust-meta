#!perl
use strict;
use warnings;

crate(
    'crossbeam-deque' => '0.7.2',
    requires          => {
        'crossbeam-epoch' => '^0.8',
        'crossbeam-utils' => '^0.7',
    },
    test => {
        rand => '^0.6',
    }
);
