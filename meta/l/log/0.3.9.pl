#!perl
use strict;
use warnings;

crate(
    log      => '0.3.9',
    requires => {
        log => '^0.4',
    },
    features => {
        default => [qw( use_std )],
        nightly => [],
        use_std => ["log/std"],
        (
            map {
                (
                    "max_level_$_"         => ["log/max_level_$_"],
                    "release_max_level_$_" => ["log/release_max_level_$_"],
                  )
            } qw( debug error info off trace warn )
        )
    }
);
