#!perl
use strict;
use warnings;

crate(
    'sha1-asm'     => '0.4.3',
    build_requires => {
        cc => '^1',
    },
);
