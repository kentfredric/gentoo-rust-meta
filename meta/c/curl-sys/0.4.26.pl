#!perl
use strict;
use warnings;

my %non_mac_unix = (
    optional => {
        'openssl-sys' => '^0.9',
    }
);
my %windows = (
    build_requires => {
        vcpkg => '^0.2',
    },
    requires => {
        winapi => '^0.3',
    },
);
crate(
    'curl-sys' => '0.4.26',
    requires   => {
        libc       => '^0.2.2',
        'libz-sys' => '^1.0.18',
    },
    optional => {
        'libnghttp2-sys' => '^0.1',
        'mesalink'       => '^1.1.0',    # 1.1.0-cratesio .... wtf?
        %{ $non_mac_unix{optional} },

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
