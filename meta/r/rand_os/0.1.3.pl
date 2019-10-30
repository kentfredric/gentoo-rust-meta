#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted, features missing
    rand_os         => '0.1.3',
    missing_options => 1,
    missing_tests   => 1,
    optional        => {
        log => '^0.4',

        # wasm
        #  stdweb => '^0.4'
        #  'wasm-bindgen' => '^0.2.12'

    },
    requires => {
        rand_core => '^0.4',

        # sgx
        #  rdrand => '^0.4',
        # cloudabi
        #  cloudabi => '^0.0.3',
        # fuchsia
        #  fuchsia-cprng => '^0.1',
        # unix
        libc => '^0.2',

        # windows
        #  winapi => '^0.3',
    },
);
