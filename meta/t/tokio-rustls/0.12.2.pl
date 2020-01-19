#!perl
use strict;
use warnings;

crate(
    'tokio-rustls' => '0.12.2',
    optional       => {
        bytes => '^0.5',
    },
    requires => {
        'futures-core' => '^0.3.1',
        rustls         => '^0.16',
        tokio          => '^0.2.0',
        webpki         => '^0.21',
    },
    test => {
        'futures-util' => '^0.3.1',
        lazy_static    => '^1',
        tokio          => '^0.2.0',
        'webpki-roots' => '^0.18',
    },
    features => {
        dangerous_configuration => [qw( rustls/dangerous_configuration )],
        'early-data'            => [],
        unstable                => [qw( bytes )],
    }
);
