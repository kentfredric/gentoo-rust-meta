#!perl
use strict;
use warnings;

my %nightly = (
    optional => {
        compiler_builtins          => '^0.1.2',
        'rustc-std-workspace-core' => '^1.0',
    },
    features => {
        core               => [qw( rustc-std-workspace-core )],
        'rustc-dep-of-std' => [
            qw(
              backtrace-sys/rustc-dep-of-std
              cfg-if/rustc-dep-of-std
              core
              compiler_builtins
              libc/rustc-dep-of-std
              rustc-demangle/rustc-dep-of-std
              )
        ],
    }
);
my %windows = (
    optional => {
        winapi => '^0.3.3'
    },
    features => {
        'verify-winapi' => [
            qw(
              winapi/dbghelp
              winapi/handleapi
              winapi/libloaderapi
              winapi/minwindef
              winapi/processthreadsapi
              winapi/synchapi
              winapi/winbase
              winapi/winnt
              )
          ]

    }
);
crate(
    backtrace => '0.3.44',
    optional  => {
        addr2line       => '^0.11',
        'backtrace-sys' => '^0.1.32',

        cpp_demangle      => '^0.2.3',
        findshlibs        => '^0.5',
        goblin            => '^0.0.24',
        memmap            => '^0.7',
        'rustc-serialize' => '^0.3',
        serde             => '^1',
    },
    requires => {
        'cfg-if'         => '^0.1.10',
        libc             => '^0.2.45',
        'rustc-demangle' => '^0.1.4',
    },
    features => {

        coresymbolication => [],
        dbghelp           => [],
        default           => [qw( std libunwind libbacktrace dladdr dbghelp )],
        dladdr            => [],
        'gimli-symbolize' => [qw( addr2line findshlibs memmap goblin )],
        kernel32          => [],
        libbacktrace      => [qw( backtrace-sys )],
        libunwind         => [],

        'serialize-rustc' => [qw( rustc-serialize )],
        'serialize-serde' => [qw( serde )],
        std               => [],
        'unix-backtrace'  => [],

    }
);
