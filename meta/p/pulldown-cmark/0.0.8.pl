#!perl
use strict;
use warnings;

crate(
    'pulldown-cmark' => '0.0.8',
    requires         => {
        getopts  => '^0.2',
        bitflags => '^0.5',
    }
);
