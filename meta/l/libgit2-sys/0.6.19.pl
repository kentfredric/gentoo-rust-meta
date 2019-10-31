#!perl
use strict;
use warnings;

crate(
    'libgit2-sys' => '0.6.19',
    optional      => {
        'curl-sys'    => '^0.4',
        'libssh2-sys' => '^0.2.4',
        'openssl-sys' => '^0.9',
    },
    requires => {
        libc       => '^0.2',
        'libz-sys' => '>=0',
    },
    build_requires => {
        cc           => '^1',
        cmake        => '^0.1.2',
        'pkg-config' => '^0.3',
    },
    features => {
        curl  => [qw( curl-sys )],
        https => [qw( openssl-sys )],
        ssh   => [qw( libssh2-sys )],
    }
);
