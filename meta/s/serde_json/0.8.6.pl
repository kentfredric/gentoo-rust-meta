#!perl
use strict;
use warnings;

crate(
    serde_json => '0.8.6',
    requires   => {
        serde        => '^0.8.13',
        'num-traits' => '~0.1.32',
        itoa         => '^0.1',
        dtoa         => '^0.2',
    },
    optional => {

        # clippy            => '^0.*', # nightly
        'linked-hash-map' => '^0.3',
    },
    features => {

        # 'unstable-testing' => [qw( clippy )], # nightly
        perserve_order => [qw( linked-hash-map linked-hash-map/serde_impl )],
    },
);
