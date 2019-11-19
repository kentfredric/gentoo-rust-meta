#!perl
use strict;
use warnings;

crate(
    'linked-hash-map' => '0.5.2',
    optional          => {

        # nightly
        # clippy => 'any_subversion(0)'
        heapsize   => '^0.4',
        serde      => '^1',
        serde_test => '^1',
    },
    features => {
        heapsize_impl => [qw( heapsize )],
        nightly       => [],
        serde_impl    => [qw( serde serde_test )],
    }
);
