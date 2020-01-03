#!perl
use strict;
use warnings;

crate(
    mio      => '0.6.21',
    requires => {
        'cfg-if' => '^0.1.9',
        iovec    => '^0.1.1',
        log      => '^0.4',
        net2     => '^0.2.29',
        slab     => '^0.4.0',
        libc     => '^0.2.42',
    },
    test => {
        bytes      => '^0.3.0',
        env_logger => '^0.4.0',
        tempdir    => '^0.3.4',
    },
    features => {
        default           => [qw( with-deprecated )],
        'with-deprecated' => [],
    }
);
