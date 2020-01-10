#!perl
use strict;
use warnings;

crate(
    pulse    => '0.5.3',
    requires => {
        atom => '^0.3',
        time => '^0.1',
    },
    features => {
        default  => [],
        callback => [],
    }
);
