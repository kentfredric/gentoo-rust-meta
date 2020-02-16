#!perl
use strict;
use warnings;

crate(
    'openssl-src' => '111.6.1',
    requires      => {
        cc => '^1',
    }
);
