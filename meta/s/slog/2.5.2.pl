#!perl
use strict;
use warnings;

crate(
    slog     => '2.5.2',
    optional => {
        'erased-serde' => '^0.3',
    },
    features => {
        default         => [qw( std )],
        'dynamic-keys'  => [],
        'nested-values' => [qw( erased-serde )],
        nothreads       => [],
        std             => [],
        map { ( "max_level_$_" => [], "release_max_level_$_" => [] ) }
          qw( debug error info off trace warn )
    }
);
