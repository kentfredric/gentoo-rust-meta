#!perl
use strict;
use warnings;

crate(
    proptest => '0.9.4',
    optional => {
        'bit-set'      => '^0.5.0',
        lazy_static    => '^1.2',
        'quick-error'  => '^1.2.1',
        'regex-syntax' => '^0.6.0',
        'rusty-fork'   => '^0.2.1',
        tempfile       => '^3.0',
    },
    requires => {
        bitflags      => '^1.0.1',
        byteorder     => '^1.2.3',
        'num-traits'  => '^0.2.2',
        rand          => '^0.6',
        rand_chacha   => '^0.1',
        rand_xorshift => '^0.1',
    },
    test => {
        regex => '^1.0',
    },
    features => {
        alloc             => [],
        atomic64bit       => [],
        'break-dead-code' => [],
        default           => [qw( std fork timeout bit-set break-dead-code )],
        'default-code-coverage' => [qw( std fork timeout bit-set )],
        fork                    => [qw( std rusty-fork tempfile )],
        std                     => [
            qw( rand/std byteorder/std lazy_static quick-error regex-syntax num-traits/std )
        ],
        timeout => [qw( fork rusty-fork/timeout )],
    }
);
