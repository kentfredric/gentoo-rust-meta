#!perl
use strict;
use warnings;

crate(
    'partial-io' => '0.3.1',
    requires     => {},
    optional     => {
        futures    => '^0.1',
        quickcheck => '^0.6',
        'tokio-io' => '^0.1',
    },
    test => {
        lazy_static  => '^1',
        quickcheck   => '^0.6',
        'tokio-core' => '^0.1',
    },
    features => {
        tokio => [qw( tokio-io futures )],
    }
);
