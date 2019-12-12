#!perl
use strict;
use warnings;

crate(
    hyphenation_commons => '0.7.1',
    requires            => {
        atlatl => '^0.1.2',
        serde  => '^1',
    }
);
