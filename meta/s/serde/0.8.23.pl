#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    serde    => '0.8.23',
    optional => {

        # nightly
        # clippy => '^0.*'
    },
    features => {
        default => [qw( std )],
        std     => [],

        # nightly
        # unstable => [],
        # alloc => [qw( unstable )],
        # collections => [qw( alloc )],
        # 'unstable-testing' => [qw( clippy unstable std )]
    }
);
