#!perl
use strict;
use warnings;

my %examples = ( memmap => '^0.7', );
crate(
    object   => '0.17.0',
    optional => {
        crc32fast     => '^1.2',
        indexmap      => '^1.1',
        flate2        => '^1',
        'parity-wasm' => '^0.41.0',
    },
    requires => {
        goblin           => '^0.1',
        scroll           => '^0.10',
        'target-lexicon' => '^0.10',
        uuid             => '^0.8',
    },
    test     => {},
    features => {
        compression => [qw( flate2 )],
        default     => [qw( read std compression wasm )],
        read        => [],
        write       => [qw( crc32fast indexmap std )],
        std         => [qw( goblin/std )],
        wasm        => [qw( std parity-wasm )],
    }
);
