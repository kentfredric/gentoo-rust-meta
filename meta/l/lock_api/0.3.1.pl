#!perl
use strict;
use warnings;

crate(
    lock_api => '0.3.1',
    optional => {
        'owning_ref' => '^0.4',
        scopeguard   => '^1',
        serde        => '^1.0.90',
    }
);
