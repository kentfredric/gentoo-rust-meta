#!perl
use strict;
use warnings;

crate(
    addr2line => '0.11.0',
    optional  => {
        cpp_demangle     => '^0.2',
        object           => '^0.17',
        'rustc-demangle' => '^0.1',
    },
    requires => {
        'fallible-iterator' => '^0.2',
        gimli               => '^0.20',
        lazycell            => '^1.0',
        smallvec            => '^1',
    },
    test => {
        backtrace => '^0.3.13',

        clap         => '^2',
        findshlibs   => '^0.5',
        memmap       => '^0.7',
        'rustc-test' => '^0.3',
    },
    features => {
        default      => [qw( rustc-demangle cpp_demangle std-object )],
        std          => [qw( gimli/std )],
        'std-object' => [qw( std object object/std )],
    }
);

