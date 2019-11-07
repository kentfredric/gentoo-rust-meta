#!perl
use strict;
use warnings;

crate(
    getrandom => '0.1.13',
    requires  => {
        'cfg-if' => '^0.1.2',

        # unix
        libc => '^0.2.64'
    },
    optional => {
        log => "^0.4",
    },
    features => {
        dummy => [],
        std   => [],
    }
);

