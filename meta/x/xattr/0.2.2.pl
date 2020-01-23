#!perl
use strict;
use warnings;

crate(
    xattr    => '0.2.2',
    requires => {
        libc => '^0.2',
    },
    test => {
        tempfile => '^3',
    },
    features => {
        default     => [qw( unsupported )],
        unsupported => [],
    }
);
