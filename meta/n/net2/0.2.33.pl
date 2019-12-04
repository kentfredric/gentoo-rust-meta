#!perl
use strict;
use warnings;

crate(
    net2     => '0.2.33',
    requires => {
        'cfg-if' => '^0.1',
        libc     => '^0.2.42',
    },
    features => {
        default  => [qw( duration )],
        duration => [],
        nightly  => [],
    }
);

