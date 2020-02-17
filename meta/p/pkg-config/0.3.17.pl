#!perl
use strict;
use warnings;

crate(
    'pkg-config' => '0.3.17',
    test         => {
        lazy_static => '^1',
    }
);
