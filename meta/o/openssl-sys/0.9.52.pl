#!perl
use strict;
use warnings;

crate(
    # TODO
    'openssl-sys' => '0.9.52',
    requires      => {
        libc => '^0.2',
    },
    build_requires => {
        autocfg      => '^0.1.2',
        cc           => '^1',
        'pkg-config' => '^0.3.9',
    },
    optional => {
        'openssl-src' => '^111.0.1',
    },
    features => {
        vendored => [qw( openssl-src )]
      }

);
