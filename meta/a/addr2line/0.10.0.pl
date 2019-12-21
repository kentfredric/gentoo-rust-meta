#!perl
use strict;
use warnings;

crate(
    addr2line => '0.10.0',
    optional  => {
        cpp_demangle     => '^0.2',
        object           => '^0.12',
        'rustc-demangle' => '^0.1',
    },
    requires => {
        'fallible-iterator' => '^0.2',
        gimli               => '^0.19',
        intervaltree        => '^0.2',
        lazycell            => '^1.0',
        smallvec            => '^0.6',
    },
    test => {
        backtrace => '^0.3.13',

        # clap         => '^2', # example + patched out test
        findshlibs => '^0.5',
        memmap     => '^0.7',

        # 'rustc-test' => '^0.3', #patched out
    },
    features => {
        alloc        => [qw( gimli/alloc )],
        default      => [qw( rustc-demangle cpp_demangle std-object )],
        std          => [qw( gimli/std intervaltree/std smallvec/std )],
        'std-object' => [qw( std object object/std )],
    }
);

