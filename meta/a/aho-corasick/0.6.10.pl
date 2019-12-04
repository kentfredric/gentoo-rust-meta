#!perl
use strict;
use warnings;

crate(
    'aho-corasick' => '0.6.10',
    requires       => {
        memchr => '^2',
    },
    test => {
        quickcheck => '^0.7',
        rand       => '^0.5',
    },
);
