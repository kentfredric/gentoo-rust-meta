#!perl
use strict;
use warnings;

crate(
    skeptic  => '0.9.0',
    requires => {
        'pulldown-cmark' => '^0.0.8',
        tempdir          => '^0.3.4',
    }
);
