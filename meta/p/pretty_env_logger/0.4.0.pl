#!perl
use strict;
use warnings;

crate(
    pretty_env_logger => '0.4.0',
    requires          => {
        env_logger => '^0.7',
        log        => '^0.4',
    }
);
