#!perl
use strict;
use warnings;

crate(
    # TODO
    'num_cpus' => '1.10.1',
    requires   => {
        libc => '^0.2.26',
    },
    test => {
        'doc-comment' => '^0.3'
    }
);
