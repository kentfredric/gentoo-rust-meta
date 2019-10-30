#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests Restricted
    log           => '0.4.8',
    missing_tests => 1,
    requires      => {
        'cfg-if' => '^0.1.2',
    },
    optional => {
        serde => '^1.0',
        sval  => '^0.4.2',
    },
    test => {
        serde_test => '^1',
    },
    features => {
        kv_unstable      => [],
        kv_unstable_sval => [qw( kv_unstable sval/fmt )],
        (
            map { ( "max_level_$_" => [], "release_max_level_$_" => [], ) }
              qw( debug error info off trace warn )
        ),
        std => [],
    }
);
