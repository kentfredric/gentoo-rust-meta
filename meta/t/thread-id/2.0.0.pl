#!perl
use strict;
use warnings;

crate(
    'thread-id' => '2.0.0',
    requires    => {
        libc           => '^0.2.6',
        'kernel32-sys' => '^0.2.1',
    }
);

