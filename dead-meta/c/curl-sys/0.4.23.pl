#!perl
use strict;
use warnings;

crate(
    'curl-sys' => '0.4.23',
    requires   => {
        libc       => '^0.2.2',
        'libz-sys' => '^1.0.18',
    },
    optional => {
        'libnghttp2-sys' => '^0.1',
        'mesalink'       => '^1.1.0',    # 1.1.0-cratesio .... wtf?
                                         # unix & !mac_os
        'openssl-sys'    => '^0.9',

        # msvc
        # vcpkg => '^0.2',
        # windows
        # winapi => '^0.3',
    },
    build_requires => {
        cc           => '^1',
        'pkg-config' => '^0.3.3',
    },
    features => {
        default                   => [qw( ssl )],
        'force-system-lib-on-osx' => [],
        http2                     => [qw( libnghttp2-sys )],
        spnego                    => [],
        ssl                       => [qw( openssl-sys )],
        'static-curl'             => [],
        'static-ssl'              => [qw( openssl-sys/vendored )],
    }
);
