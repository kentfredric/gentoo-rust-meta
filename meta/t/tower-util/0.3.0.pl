#!perl
use strict;
use warnings;

crate(
    'tower-util' => '0.3.0',
    requires     => {
        'futures-core'  => '^0.3',
        'pin-project'   => '^0.4',
        'tower-service' => '^0.3',
    },
    optional => {
        'futures-util' => '^0.3',
    },
    test => {
        tokio        => '^0.2',
        'tokio-test' => '^0.2',
        'tower-test' => '^0.3',
    },
    features => {
        'call-all' => [qw( futures-util )],
        default    => [qw( call-all )],
    }
);
