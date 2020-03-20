#!perl
use strict;
use warnings;

my %mac = (
    requires => {
        libc => '^0.2',
    }
);
my %windows = (
    requires => {
        winapi => '^0.3',
    }
);

crate(
    rand_jitter => '0.2.0',
    optional    => {
        log => '^0.4',
    },
    requires => {
        rand_core => '^0.5',
    },
    features => {
        std => [qw( rand_core/std )],
    }
);
