#!perl
use strict;
use warnings;

crate(
    'hyper-tls' => '0.4.1',
    requires    => {
        bytes        => '^0.5',
        hyper        => '^0.13',
        'native-tls' => '^0.2',
        tokio        => '^0.2',
        'tokio-tls'  => '^0.3',
    },
    test => {
        tokio => '^0.2',
    },
    features => {
        vendored => [qw( native-tls/vendored )],
    }
);
