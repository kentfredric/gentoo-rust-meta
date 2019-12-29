#!perl
use strict;
use warnings;

crate(
    'dirs-sys' => '0.3.4',
    requires   => {
        'cfg-if' => '^0.1',

        # redox
        # redox_users => '^0.3.0',

        # unix
        libc => '^0.2',

        # windows
        # winapi => '^0.3',
    }
);
