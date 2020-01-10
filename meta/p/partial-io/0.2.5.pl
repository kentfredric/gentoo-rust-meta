#!perl
use strict;
use warnings;

# Patched out
my %example_deps = ( lazy_static => '^0.2', );
crate(
    'partial-io' => '0.2.5',
    optional     => {
        quickcheck => '^0.4',
        'tokio-io' => '^0.1',
        futures    => '^0.1',
    },
    test => {
        quickcheck   => '^0.4',
        'tokio-core' => '^0.1',
    },
    features => {
        'tokio' => [qw( tokio-io futures )],
    }
);
