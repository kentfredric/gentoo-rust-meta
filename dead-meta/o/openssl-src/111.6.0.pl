#!perl
use strict;
use warnings;

crate(
    'openssl-src' => '111.6.0',
    requires      => {
        cc => '^1',
    }
);
