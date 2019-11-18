#!perl
use strict;
use warnings;

crate(
    object   => '0.12.0',
    optional => {
        flate2        => '^1',
        'parity-wasm' => '^0.38.0',
    },
    requires => {
        goblin => '^0.0.22',
        scroll => '^0.9',
        uuid   => '^0.7',
    },
    test => {

        # memmap => '^0.7' # example
    },
    features => {
        compression => [qw( flate2 )],
        default     => [qw( std compression wasm )],
        std         => [qw( goblin/std )],
        wasm        => [qw( std parity-wasm )],
    }
);
