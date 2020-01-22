#!perl
use strict;
use warnings;

crate(
    'hyper-rustls' => '0.19.1',
    optional       => {
        'ct-logs'             => '^0.6.0',
        'rustls-native-certs' => '^0.1.0',
    },
    requires => {
        bytes          => '^0.5.2',
        'futures-util' => '^0.3.1',
        hyper          => '^0.13.0',
        rustls         => '^0.16',
        tokio          => '^0.2.4',
        'tokio-rustls' => '^0.12.1',
        webpki         => '^0.21.0',
    },
    test => {
        tokio => '^0.2.4',
    },
    features => {
        default         => [qw( tokio-runtime )],
        'tokio-runtime' => [qw( hyper/runtime ct-logs rustls-native-certs )],
    }
);
