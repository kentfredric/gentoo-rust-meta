#!perl
use strict;
use warnings;

crate(
    openssl => '0.10.26',

    requires => {
        bitflags        => '^1.0',
        'cfg-if'        => '^0.1',
        'foreign-types' => '^0.3.1',
        lazy_static     => '^1',
        libc            => '^0.2',
        'openssl-sys'   => '^0.9.53',
    },
    test => {
        hex     => '^0.3',
        tempdir => '^0.3',

    },
    features => {
        v101     => [],
        v102     => [],
        v110     => [],
        v111     => [],
        vendored => [qw( openssl-sys/vendored )],
    }
);
