#!perl
use strict;
use warnings;

crate(
    'sha1-asm'     => '0.4.4',
    build_requires => {
        cc => '^1',
    },
);
