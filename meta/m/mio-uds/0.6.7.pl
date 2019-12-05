#!perl
use strict;
use warnings;

crate(
    'mio-uds' => '0.6.7',
    requires  => {
        iovec => '^0.1',       # unix
        libc  => '^0.2.42',    # unix
        mio   => '^0.6.5',     # unix
    },
    test => {
        tempdir => '^0.3',
    },
);
