#!perl
use strict;
use warnings;

crate(
    flate2          => '1.0.13',
    missing_tests   => 1,
    missing_options => 1,
    requires        => {
        'cfg-if'  => '^0.1.6',
        crc32fast => '^1.2.0',
        futures   => '^0.1.25',
        libc      => '^0.2.65',
    },
    optional => {
        'libz-sys'    => '^1.0.25',
        'miniz-sys'   => '^0.1.11',
        'miniz_oxide' => '^0.3.5',
        'tokio-io'    => '^0.1.11',
    },
    test => {
        futures            => '^0.1',
        quickcheck         => '^0.9',
        rand               => '^0.7',
        'tokio-io'         => '^0.1.11',
        'tokio-tcp'        => '^0.1.3',
        'tokio-threadpool' => '^0.1.10',
    },
    features => {
        default      => [qw( rust_backend )],
        rust_backend => [qw( miniz_oxide )],
        tokio        => [qw( tokio-io futures )],
        zlib         => [qw( libz-sys )],
    }
);
