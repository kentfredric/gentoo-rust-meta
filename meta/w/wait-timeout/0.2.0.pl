#!perl
use strict;
use warnings;

crate(
    'wait-timeout' => '0.2.0',
    requires       => {

        # Unix
        libc => '^0.2',
    }
);
