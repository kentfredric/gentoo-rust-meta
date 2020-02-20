#!perl
use strict;
use warnings;

crate(
    'tokio-codec' => '0.1.2',
    requires      => {
        bytes      => '^0.4.7',
        futures    => '^0.1.18',
        'tokio-io' => '^0.1.7',
    }
);
