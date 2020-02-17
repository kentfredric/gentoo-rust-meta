#!perl
use strict;
use warnings;

crate(
    'pin-project-lite' => '0.1.4',
    test               => {
        rustversion => '^1',
        trybuild    => '^1',
    }
);
