#!perl
use strict;
use warnings;

crate(
    memoffset      => '0.5.3',
    build_requires => {
        rustc_version => '^0.2.3',
    },
    test => {
        'doc-comment' => '^0.3',
    }
);
