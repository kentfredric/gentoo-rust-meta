#!perl
use strict;
use warnings;

crate(
    thread_local => '0.2.7',
    requires     => {
        'thread-id' => '^2.0',
    }
);
