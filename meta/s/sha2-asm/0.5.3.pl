#!perl
use strict;
use warnings;

crate(
    'sha2-asm' => '0.5.3',
    requires   => {
        cc => '^1.0',
    }
);
