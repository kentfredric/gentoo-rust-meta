#!perl
use strict;
use warnings;

crate(
    memmap   => '0.4.0',
    requires => {
        fs2            => '^0.2',
        'kernel32-sys' => '^0.2',
        libc           => '^0.2',
        winapi         => '^0.2',
    },
    test => {
        tempdir => '^0.3',
    },

);
