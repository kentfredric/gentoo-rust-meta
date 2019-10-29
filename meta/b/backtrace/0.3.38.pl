#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted, features missing
    backtrace       => '0.3.38',
    missing_tests   => 1,
    missing_options => 1,
    optional        => {
        addr2line       => '^0.10',
        'backtrace-sys' => '^0.1.17',

        # nightly only
        # compiler_builtins => '^0.1.2'
        #'rustc-std-workspace-core' => '^1.0',
        cpp_demangle      => '^0.2.3',
        findshlibs        => '^0.5',
        goblin            => '^0.0.24',
        memmap            => '^0.7',
        'rustc-serialize' => '^0.3',
        serde             => '^1',

        # windows
        # winapi => '^0.3.3'
    },
    requires => {
        'cfg-if'         => '^0.1.6',
        libc             => '^0.2.45',
        'rustc-demangle' => '^0.1.4',
    },
    features => {
        core              => [qw( rustc-std-workspace-core )],
        coresymbolication => [],
        dbghelp           => [],
        default           => [qw( std libunwind libbacktrace dladdr dbghelp )],
        dladdr            => [],
        'gimli-symbolize' => [qw( addr2line findshlibs memmap goblin )],
        kernel32          => [],
        libbacktrace      => [qw( backtrace-sys )],
        libunwind         => [],

        # nightly only
        # 'rustc-dep-of-std' => [qw(
        #   backtrace-sys/rustc-dep-of-std
        #   cfg-if/rustc-dep-of-std
        #   core
        #   compiler_builtins
        #   libc/rustc-dep-of-std
        #   rustc-demangle/rustc-dep-of-std
        # )],
        'serialize-rustc' => [qw( rustc-serialize )],
        'serialize-serde' => [qw( serde )],
        std               => [],
        'unix-backtrace'  => [],

        # windows
        # verify-winapi => [ ... ]
    }
);
