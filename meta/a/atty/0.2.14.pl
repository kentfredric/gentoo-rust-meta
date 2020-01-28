#!perl
use strict;
use warnings;

my %unix = (
    requires => {
        libc => '^0.2',
    },
);
my %windows = (
    requires => {
        winapi => '^0.3',
    },
);
my %hermit = (
    requires => {
        'hermit-abi' => '^0.1.6',
    },
);
crate(
    atty     => '0.2.14',
    requires => { %{ $unix{requires} } }
);
