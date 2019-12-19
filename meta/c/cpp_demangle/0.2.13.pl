#!perl
use strict;
use warnings;

crate(
    cpp_demangle => '0.2.13',
    optional     => {
        afl => '^0.4.4',
    },
    requires => {
        'cfg-if' => '^0.1.9',
    },
    test => {

        # clap => '^2.33.0', # example
        diff => '^0.1.11',
    },
    build_requires => {
        glob => '^0.3.0',
    },
    features => {
        alloc               => [],
        cppfilt             => [],
        default             => [qw( std )],
        fuzz                => [qw( afl )],
        logging             => [],
        nightly             => [],
        run_libiberty_tests => [],
        std                 => [],
    },
);

