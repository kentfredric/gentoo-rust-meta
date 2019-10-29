#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted, features missing
    lock_api        => '0.3.1',
    missing_tests   => 1,
    missing_options => 1,
    optional        => {
        'owning_ref' => '^0.4',
        scopeguard   => '^1',
        serde        => '^1.0.90',
    }
);
