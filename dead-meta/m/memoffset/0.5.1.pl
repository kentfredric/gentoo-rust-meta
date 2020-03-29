#!perl
use strict;
use warnings;

crate(
    memoffset      => '0.5.1',
    build_requires => {
        rustc_version => '^0.2.3',
    }
);
