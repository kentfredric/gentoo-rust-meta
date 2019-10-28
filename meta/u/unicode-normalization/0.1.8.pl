#!perl
use strict;
use warnings;

crate(
    'unicode-normalization' => '0.1.8',
    requires                => {
        smallvec => '^0.6',
    }
);

