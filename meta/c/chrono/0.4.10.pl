#!perl
use strict;
use warnings;

my %wasm = (
    optional => {
        'js-sys'       => '^0.3',
        'wasm-bindgen' => '^0.2',
    },
    test => {
        'wasm-bindgen-test' => '^0.2',
    },
    features => {
        wasmbind => [qw( wasm-bindgen js-sys)]
    }
);
crate(
    chrono   => '0.4.10',
    requires => {
        'num-integer' => '^0.1.36',
        'num-traits'  => '^0.2',
    },
    optional => {
        'rustc-serialize' => '^0.3.20',
        serde             => '^1.0.99',
        time              => '^0.1.39',
    },
    test => {
        bincode       => '^0.8',
        'doc-comment' => '^0.3',
        'num-iter'    => '^0.1.35',
        serde_derive  => '^1',
        serde_json    => '^1',
    },
    features => {
        alloc   => [],
        bench   => [qw( std )],
        clock   => [qw( time std )],
        default => [qw( clock std )],
        std     => [],
    }
);
