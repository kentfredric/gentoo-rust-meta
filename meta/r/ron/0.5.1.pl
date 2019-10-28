#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    ron           => '0.5.1',
    missing_tests => 1,
    requires      => {
        base64   => '^0.10',
        bitflags => '^1',
        serde    => '^1',
    },
    test => {
        serde_bytes => '^0.10',
        serde_json  => '^1',
    },
);

