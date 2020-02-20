#!perl
use strict;
use warnings;

crate(
    'unicode-normalization' => '0.1.12',
    requires                => {
        smallvec => '^1.1',
    }
);

