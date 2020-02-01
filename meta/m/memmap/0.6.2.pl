#!perl
use strict;
use warnings;

my %unix = (
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
    memmap   => '0.6.2',
    requires => { %{ $unix{requires} } },
    test     => {
        tempdir => '^0.3',
    },
);
