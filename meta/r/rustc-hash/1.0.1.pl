#!perl
use strict;
use warnings;

crate(
    'rustc-hash' => '1.0.1',
    requires     => {
        byteorder => '^1.1',
    }
);
