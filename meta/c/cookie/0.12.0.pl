#!perl
use strict;
use warnings;

crate(
    cookie   => '0.12.0',
    optional => {
        base64 => '^0.10.0',
        ring   => '^0.14.0',
        url    => '^1.0',
    },
    requires => {
        time => '^0.1',
    },
    features => {
        'percent-encode' => [qw( url )],
        secure           => [qw( ring base64 )],
    }
);
