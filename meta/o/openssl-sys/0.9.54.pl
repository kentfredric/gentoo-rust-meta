#!perl
use strict;
use warnings;

my %msvc = (
    build_requires => {
        vcpkg => '^0.2',
    }
);

crate(
    'openssl-sys' => '0.9.54',
    requires      => {
        libc => '^0.2',
    },
    build_requires => {
        autocfg      => '^1',
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
