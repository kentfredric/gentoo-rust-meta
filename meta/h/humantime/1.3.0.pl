#!perl
use strict;
use warnings;

crate(
    humantime => '1.3.0',
    requires  => {
        'quick-error' => '^1',
    },
    test => {

        # bench: chrono => '0.4.0',
        rand => '^0.4.2',
        time => '^0.1.39',
    }
);
