#!perl
use strict;
use warnings;

crate(
    'signal-hook' => '0.1.12',
    missing_tests => 1,
    optional      => {
        futures         => '~0.1',
        mio             => '~0.6',
        'tokio-reactor' => '~0.1',
    },
    requires => {
        libc                   => '~0.2',
        'signal-hook-registry' => '~1.2',
    },
    test => {
        tokio          => '~0.1',
        'version-sync' => '~0.8',
    },
    features => {
        'mio-support'   => [qw( mio )],
        'tokio-support' => [qw( futures mio-support tokio-reactor )],
    }
);
