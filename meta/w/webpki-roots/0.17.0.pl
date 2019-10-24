#!perl
use strict;
use warnings;

crate(
    'webpki-roots' => '0.17.0',
    requires       => {
        webpki => '^0.21',
    }
);

