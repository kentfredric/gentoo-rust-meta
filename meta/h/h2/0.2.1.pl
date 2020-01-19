#!perl
use strict;
use warnings;

crate(
    h2       => '0.2.1',
    requires => {
        bytes          => '^0.5.2',
        fnv            => '^1.0.5',
        'futures-core' => '^0.3',
        'futures-sink' => '^0.3',
        'futures-util' => '^0.3',
        http           => '^0.2',
        indexmap       => '^1.0',
        log            => '^0.4.1',
        slab           => '^0.4.0',
        tokio          => '^0.2',
        'tokio-util'   => '^0.2',
    },
    test => {
        env_logger     => '^0.5.3',
        hex            => '^0.2.0',
        quickcheck     => '^0.4.1',
        rand           => '^0.3.15',
        rustls         => '^0.16',
        serde          => '^1.0.0',
        serde_json     => '^1.0.0',
        tokio          => '^0.2',
        'tokio-rustls' => '^0.12.0',
        walkdir        => '^1.0.0',
        webpki         => '^0.21',
        'webpki-roots' => '^0.17',
    },
    features => {
        stream   => [],
        unstable => [],
    }
);
