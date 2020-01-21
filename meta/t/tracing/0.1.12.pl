#!perl
use strict;
use warnings;

my %benches = (
    criterion => '^0.3',

);
crate(
    tracing  => '0.1.12',
    requires => {
        'cfg-if'             => '^0.1.10',
        'tracing-attributes' => '^0.1.6',
        'tracing-core'       => '^0.1.9',
    },
    optional => {
        log => '^0.4',
    },
    test => {
        futures => '^0.1',
        log     => '^0.4',
    },
    features => {
        'async-await' => [],
        default       => [qw( std )],
        'log-always'  => [qw( log )],
        (
            map { ( "max_level_$_" => [], "release_max_level_$_" => [], ) }
              qw( debug error info off trace warn )
        ),
        std => [qw( tracing-core/std )],

    }
);
