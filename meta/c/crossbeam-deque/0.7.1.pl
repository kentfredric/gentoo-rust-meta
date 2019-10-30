#!perl
use strict;
use warnings;

crate(
    'crossbeam-deque' => '0.7.1',
    requires          => {
        'crossbeam-epoch' => '^0.7',
        'crossbeam-utils' => '^0.6.5',
    },
    test => {
        rand => '^0.6',
    }
);
