#!perl
use strict;
use warnings;

crate(
    'thread-id' => '3.3.0',
    requires    => {

        # unix
        libc => '^0.2.6',

        # windows
        # winapi => '^0.3',
        # redox
        # redox_syscall => '^0.1'
    }
);
