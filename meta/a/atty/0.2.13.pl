#!perl
use strict;
use warnings;

crate(
    atty     => '0.2.13',
    requires => {

        # unix
        libc => '^0.2',

        # windows
        # winapi => '^0.3'
    }
);
