#!perl
use strict;
use warnings;

crate(
    'fs2'    => '0.2.5',
    requires => {
        libc           => '^0.2.2',
        winapi         => '^0.2',
        'kernel32-sys' => '^0.2',
    },
    test => {
        'tempdir' => '^0.3',
    }
);
