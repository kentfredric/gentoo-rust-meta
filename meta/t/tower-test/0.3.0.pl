#!perl
use strict;
use warnings;

crate(
    'tower-test' => '0.3.0',
    requires     => {
        'futures-util'  => '^0.3',
        'pin-project'   => '^0.4',
        tokio           => '^0.2',
        'tokio-test'    => '^0.2',
        'tower-layer'   => '^0.3',
        'tower-service' => '^0.3',
    },
    test => {
        tokio => '^0.2',
    }
);
