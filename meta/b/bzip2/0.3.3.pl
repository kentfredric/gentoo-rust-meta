#!perl
use strict;
use warnings;

crate(
    'bzip2'  => '0.3.3',
    requires => {
        'bzip2-sys' => '^0.1',
        libc        => '^0.2',
    },
    optional => {
        futures    => '^0.1',
        'tokio-io' => '^0.1',
    },
    test => {
        'partial-io' => '^0.2.1',
        quickcheck   => '^0.4',
        rand         => '^0.3',
        'tokio-core' => '^0.1',
    },
    features => {
        tokio => [qw( tokio-io futures )],
    }
);
