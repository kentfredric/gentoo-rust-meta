#!perl
use strict;
use warnings;

crate(
    thread_local => '0.3.6',
    requires     => {
        lazy_static => '^1.0',
    }
);
