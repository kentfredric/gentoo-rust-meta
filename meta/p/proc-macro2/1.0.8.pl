#!perl
use strict;
use warnings;

crate(
    'proc-macro2' => '1.0.8',
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
