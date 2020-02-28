#!perl
use strict;
use warnings;

my %examples = ( hyper => '^0.13', );
crate(
    'tokio-socks' => '0.2.0',
    requires      => {
        bytes     => '^0.4',
        derefable => '^0.1',
        either    => '^1',
        failure   => '^0.1',
        futures   => '^0.3',
        tokio     => '^0.2',
    },
    test => {
        once_cell => '^1.2.0',
        tokio     => '^0.2',
    },
    features => {
        tor => [],
    },
);
