#!perl
use strict;
use warnings;

crate(
    nodrop   => '0.1.14',
    optional => {

        # nightly
        # 'nodrop-union' => '^0.1.8',
    },
    features => {
        default        => [qw( std )],
        std            => [],
        use_needs_drop => [],

        # nightly
        # use_union => [qw( nodrop-union )],
    }
);
