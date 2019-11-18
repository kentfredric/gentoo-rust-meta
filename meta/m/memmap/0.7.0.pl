#!perl
use strict;
use warnings;

crate(
    memmap   => '0.7.0',
    requires => {
        libc => '^0.2',    # unix

        # winapi => '^0.3', # windows
    },
    test => {
        tempdir => '^0.3',
    },
);
