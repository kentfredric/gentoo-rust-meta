#!perl
use strict;
use warnings;

crate(
    'proc-macro2' => '0.4.27',
    requires      => {
        'unicode-xid' => '^0.1',
    },
    features => {
        default          => ['proc-macro'],
        nightly          => [],
        'proc-macro'     => [],
        'span-locations' => []
    },
);
