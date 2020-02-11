#!perl
use strict;
use warnings;

my %hermit_64 = (
    requires => {
        'hermit-abi' => '^0.1.3',
    }
);
crate(
    'num_cpus' => '1.12.0',
    requires   => {
        libc => '^0.2.26',
    },
    test => {
        'doc-comment' => '^0.3'
    }
);
