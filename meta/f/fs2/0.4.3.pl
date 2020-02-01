#!perl
use strict;
use warnings;

my %unix = (
    requires => {
        libc => '^0.2.30',
    }
);
my %windows = (
    requires => {
        winapi => '^0.3',
    }
);
crate(
    'fs2'    => '0.4.3',
    requires => { %{ $unix{requires} } },
    test     => {
        'tempdir' => '^0.3',
    }
);
