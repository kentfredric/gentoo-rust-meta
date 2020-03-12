#!perl
use strict;
use warnings;

crate(
    thread_local => '1.0.1',
    requires     => {
        lazy_static => '^1.0',
    }
);
