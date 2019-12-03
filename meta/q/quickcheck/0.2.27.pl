#!perl
use strict;
use warnings;

crate(
    quickcheck => '0.2.27',
    requires   => {
        env_logger => '^0.3',
        log        => '^0.3',
        rand       => '^0.3',
    }
);
