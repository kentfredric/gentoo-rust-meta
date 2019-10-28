#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests restricted
    'proc-macro2' => '1.0.5',
    missing_tests => 1,
    requires      => {
        'unicode-xid' => '^0.2',
    },
    test => {
        quote => '^1.0',
    },
    features => {
        default          => ['proc-macro'],
        nightly          => [],
        'proc-macro'     => [],
        'span-locations' => [],
    }
);
