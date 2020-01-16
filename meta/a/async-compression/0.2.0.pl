#!perl
use strict;
use warnings;

crate(
    'async-compression' => '0.2.0',
    requires            => {
        'futures-core'     => '^0.3.0',
        memchr             => '^2.2.1',
        'pin-project-lite' => '^0.1.1',
    },
    optional => {
        brotli2      => '^0.3.2',
        bytes        => '^0.5.0',
        bzip2        => '^0.3.3',
        flate2       => '^1.0.11',
        'futures-io' => '^0.3.0',
        zstd         => '^0.5.0',
        'zstd-safe'  => '^2.0.0',
    },
    test => {
        'futures'         => '^0.3.0',
        'futures-test'    => '^0.3.0',
        ntest             => '^0.3.3',
        proptest          => '^0.9.4',
        'proptest-derive' => '^0.1.2',
        rand              => '^0.7.2',
        timebomb          => '^0.1.2',
    },
    features => {
        all                   => [qw( all-implementations all-algorithms )],
        'all-algorithms'      => [qw( brotli bzip2 deflate gzip zlib zstd )],
        'all-implementations' => [qw( futures-bufread futures-write stream )],
        brotli                => [qw( brotli2 )],
        default               => [],
        deflate               => [qw( flate2 )],
        'futures-bufread'     => [qw( futures-io )],
        'futures-write'       => [qw( futures-io )],
        gzip                  => [qw( flate2 )],
        stream                => [qw( bytes )],
        zlib                  => [qw( flate2 )],

        # Flag called 'zstd' and 'zstd' renamed 'libzstd' internally
        f_zstd => [qw( zstd zstd-safe )],
    }
);
