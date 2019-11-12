#!perl
use strict;
use warnings;

crate(
    getopts  => '0.2.21',
    requires => {
        'unicode-width' => '^0.1.5',
    },
    test => {
        log => '^0.4',
    }
);
