#!perl
use strict;
use warnings;

crate(
    bindgen => '0.51.1',

    requires => {
        bitflags           => '^1.0.3',
        cexpr              => '^0.3.3',
        'cfg-if'           => '^0.1.0',
        'clang-sys'        => '^0.28.0',
        lazy_static        => '^1',
        peeking_take_while => '^0.1.2',
        'proc-macro2'      => '^1',
        quote              => '^1',
        regex              => '^1',
        'rustc-hash'       => '^1.0.1',
        shlex              => '^0.1',
    },
    optional => {
        clap       => '^2',
        env_logger => '^0.6',
        log        => '^0.4',
        which      => '^3.0',
    },
    test => {
        clap => '^2',
        diff => '^0.1',
    },
    features => {
        default                       => [qw( logging clap which-rustfmt )],
        logging                       => [qw( env_logger log )],
        static                        => [],
        testing_only_docs             => [],
        testing_only_extra_assertions => [],
        testing_only_libclang_3_8     => [],
        testing_only_libclang_3_9     => [],
        testing_only_libclang_4       => [],
        testing_only_libclang_5       => [],
        'which-rustfmt'               => [qw( which )],

    }
);
