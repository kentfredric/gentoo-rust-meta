#!perl
use strict;
use warnings;

crate(
    iovec    => '0.1.4',
    requires => {
        libc => '^0.2',    # unix
    },
);
