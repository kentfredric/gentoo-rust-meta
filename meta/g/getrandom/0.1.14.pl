#!perl
use strict;
use warnings;
my %nightly = (
    optional => {
        compiler_builtins          => '^0.1',
        'rustc-std-workspace-core' => '^1.0',
    },
    features => {
        'rustc-dep-of-std' =>
          [qw( compiler_builtins rustc-std-workspace-core )],
    },
);
my %wasi = (
    requires => {
        wasi => '^0.9',
    },
);
my %wasm = (
    optional => {
        stdweb         => '^0.4.18',
        'wasm-bindgen' => '^0.2.29',
    },
    test => {
        'wasm-bindgen-test' => '^0.2',
    },
    features => {
        'test-in-browser' => [qw( wasm-bindgen )],
    },
);
my %unix = (
    requires => {
        libc => '^0.2.64',
    }
);
crate(
    getrandom => '0.1.14',
    requires  => {
        'cfg-if' => '^0.1.2',
        %{ $unix{requires} }
    },
    optional => {
        log => "^0.4",
    },
    features => {
        dummy => [],
        std   => [],
    }
);

