#!perl
use strict;
use warnings;

crate(
    'tokio-util' => '0.2.0',
    requires     => {
        bytes              => '^0.5.0',
        'futures-core'     => '^0.3.0',
        'futures-sink'     => '^0.3.0',
        log                => '^0.4',
        'pin-project-lite' => '^0.1.1',
        tokio              => '^0.2.0',
    },
    test => {
        futures      => '^0.3.0',
        tokio        => '^0.2.0',
        'tokio-test' => '^0.2.0',
    },
    features => {
        codec   => [],
        default => [],
        full    => [qw( codec udp )],
        udp     => [qw( tokio/udp )],
    }
);
