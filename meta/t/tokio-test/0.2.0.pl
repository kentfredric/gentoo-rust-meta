#!perl
use strict;
use warnings;

crate(
    'tokio-test' => '0.2.0',
    requires     => {
        bytes          => '^0.5.0',
        'futures-core' => '^0.3.0',
        tokio          => '^0.2.0',
    },
    test => {
        'futures-util' => '^0.3.0',
        tokio          => '^0.2.0',
    }
);
