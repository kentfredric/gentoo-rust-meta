#!perl
use strict;
use warnings;

crate(
    'proc-macro2' => '0.4.30',
    requires      => {
        'unicode-xid' => '^0.1',
    },
    test => {
        quote => '^0.6',
    },
    features => {
        default          => ['proc-macro'],
        nightly          => [],
        'proc-macro'     => [],
        'span-locations' => []
    },
);
