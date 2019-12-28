#!perl
use strict;
use warnings;

crate(
    'regex-syntax' => '0.4.2',
    test           => {
        quickcheck => '^0.6',
        rand       => '^0.4',
    }
);
