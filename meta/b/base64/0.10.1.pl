#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    base64        => '0.10.1',
    missing_tests => 1,
    requires      => {
        byteorder => '^1.2.6',
    },
    test => {
        criterion => '^0.2',
        rand      => '^0.6.1',
    }
);
