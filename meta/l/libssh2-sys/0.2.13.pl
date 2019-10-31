#!perl
use strict;
use warnings;

crate(
    'libssh2-sys' => '0.2.13',
    requires      => {
        libc          => '^0.2',
        'libz-sys'    => '^1.0.21',
        'openssl-sys' => '^0.9.35',
    },
    build_requires => {
        cc           => '^1.0.25',
        'pkg-config' => '^0.3.11',
    }
);
