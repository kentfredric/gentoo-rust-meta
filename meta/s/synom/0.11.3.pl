#!perl
use strict;
use warnings;

crate(
    synom         => '0.11.3',
    missing_tests => 1,
    requires      => {
        'unicode-xid' => '^0.0.4',
    },
    test => {
        syn => '^0.11',
    }
);

