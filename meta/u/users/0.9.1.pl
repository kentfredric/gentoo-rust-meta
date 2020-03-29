#!perl
use strict;
use warnings;

crate(
    users    => '0.9.1',
    requires => {
        libc => '^0.2.50',
    },
    features => {
        cache   => [],
        default => [qw( cache mock )],
        mock    => [],
    }
);
