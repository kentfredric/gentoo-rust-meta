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
    generator => '0.6.20',
    requires  => {
        log => '^0.4',
        %{ $unix{requires} },
    },
    build_requires => {
        cc            => '^1.0',
        rustc_version => '^0.2',
    }
);
