#!perl
use strict;
use warnings;

crate(
    rand_os  => '0.2.2',
    optional => {},
    requires => {
        getrandom => '^0.1.1',
        rand_core => '^0.5',
    },
    features => {
        log            => [qw( getrandom/log )],
        stdweb         => [qw(  getrandom/stdweb )],
        'wasm-bindgen' => [qw( getrandom/wasm-bindgen )],
    }
);
