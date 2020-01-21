#!perl
use strict;
use warnings;

crate(
    'tower-service' => '0.3.0',
    test            => {
        http => '^0.1',
    }
);
