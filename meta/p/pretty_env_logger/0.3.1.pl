#!perl
use strict;
use warnings;

crate(
    pretty_env_logger => '0.3.1',
    requires          => {
        chrono     => '^0.4.4',
        env_logger => '^0.6.2',
        log        => '^0.4',
    }
);
