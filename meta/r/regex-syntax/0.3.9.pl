#!perl
use strict;
use warnings;

crate(
    'regex-syntax' => '0.3.9',
    test           => {
        quickcheck => '^0.2',
        rand       => '^0.3',
    }
);

