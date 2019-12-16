#!perl
use strict;
use warnings;

crate(
    'linked-hash-map' => '0.3.0',
    optional          => {

        # 'clippy'   => '0.*', # nightly
        serde      => '^0.8',
        serde_test => '^0.8',
    },
    features => {

        #  nightly    => [],# nightly
        serde_impl => [qw( serde serde_test )],
    }
);
