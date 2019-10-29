#!perl
use strict;
use warnings;

crate(
    termios  => '0.3.1',
    requires => {
        libc => '^0.2',
    }
);
