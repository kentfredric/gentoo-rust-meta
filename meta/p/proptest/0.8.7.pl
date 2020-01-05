#!perl
use strict;
use warnings;

crate(
    proptest => '0.8.7',
    optional => {
        'bit-set'      => '^0.5.0',
        'quick-error'  => '^1.2.1',
        'regex-syntax' => '^0.6.0',
        'rusty-fork'   => '^0.2.1',
        tempfile       => '^3.0',
    },
    requires => {
        bitflags     => '^1.0.1',
        byteorder    => '^1.2.3',
        lazy_static  => '^1.0.0',
        'num-traits' => '^0.2.2',
        rand         => '^0.5.0',
    },
    test => {
        'regex' => '^1.0',
    },
    features => {
        alloc   => [],
        default => [qw( std fork timeout bit-set )],
        fork    => [qw( std rusty-fork tempfile )],

        # patched
        #nightly => [qw( lazy_static/spin_no_std )],
        std => [
            qw( rand/std byteorder/std quick-error regex-syntax num-traits/std )
        ],
        timeout => [qw( fork rusty-fork/timeout )],

        # patched
        # unstable => [qw( rand/i128_support )],
    }
);
