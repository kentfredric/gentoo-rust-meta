#!perl
use strict;
use warnings;

crate(
    'http-body' => '0.3.1',
    requires    => {
        bytes => '^0.5',
        http  => '^0.2',
    }
);
