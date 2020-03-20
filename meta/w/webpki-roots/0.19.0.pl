#!perl
use strict;
use warnings;

crate(
    'webpki-roots' => '0.19.0',
    requires       => {
        webpki => '^0.21.0',
    },
);
