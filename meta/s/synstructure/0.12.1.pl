#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    synstructure  => '0.12.1',
    missing_tests => 1,
    requires      => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1',
        'unicode-xid' => '^0.2',
    },
    test => {
        synstructure_test_traits => '^0.1',
    }
);
