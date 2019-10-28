#!perl
use strict;
use warnings;

crate(
    # TODO
    git2     => '0.6.11',
    requires => {
        bitflags      => '^0.9',
        libc          => '^0.2',
        'libgit2-sys' => '^0.6.19',
        url           => '^1',
    },
    optional => {

        # example
        # docopt => '^0.8',
        #serde => '^1',
        #serde_derive => '^1',
        tempdir => '^0.3',

        # unix & !mac_os
        'openssl-probe' => '^0.1',

        # unix &!mac_os
        'openssl-sys' => '^0.9',
    },
    test => {
        tempdir => '^0.3',
        time    => '^0.1',
    },
    features => {
        curl    => [qw( libgit2-sys/curl )],
        default => [qw( ssh https curl )],
        https   => [qw( libgit2-sys/https openssl-sys openssl-probe )],
        ssh     => [qw( libgit2-sys/ssh )],

        # unstable => [],
    }
);
