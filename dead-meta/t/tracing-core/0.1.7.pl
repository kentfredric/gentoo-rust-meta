#!perl
use strict;
use warnings;

crate(
    'tracing-core' => '0.1.7',
    requires       => {
        lazy_static => '^1',
        spin        => '^0.5',
    }
);
