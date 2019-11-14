#!perl
use strict;
use warnings;

crate(
    miniz_oxide => '0.3.5',
    requires    => {
        'adler32' => '^1.0.3',
    }
);
