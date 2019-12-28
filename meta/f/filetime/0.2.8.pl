#!perl
use strict;
use warnings;

crate(
    filetime => '0.2.8',
    requires => {
        'cfg-if' => '^0.1.6',

        # # redox
        # redox_syscall => '^0.1',
        # # unix
        libc => '^0.2.27',

        # # windows
        # winapi => '^0.3',
    },
    test => {
        tempfile => '^3',
    }
);
