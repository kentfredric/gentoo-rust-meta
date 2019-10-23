#!perl
use strict;
use warnings;

crate(
    sct      => '0.6.0',
    requires => {
        ring      => '^0.16',
        untrusted => '^0.7',
    }
);
