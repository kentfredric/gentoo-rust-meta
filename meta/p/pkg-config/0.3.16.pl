#!perl
use strict;
use warnings;

crate(
    'pkg-config' => '0.3.16',
    test         => {
        lazy_static => '^1',
    }
);
