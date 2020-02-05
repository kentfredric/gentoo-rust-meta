#!perl
use strict;
use warnings;

crate(
    'tower-layer' => '0.3.0',
    test          => {
        'tower-service' => '^0.3.0',
    }
);
