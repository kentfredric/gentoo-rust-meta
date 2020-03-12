#!perl
use strict;
use warnings;

my %unix = (
    requires => {
        libc                   => '^0.2',
        'mio-uds'              => '^0.6',
        'signal-hook-registry' => '~1',
    }
);
my %windows = (
    requires => {
        winapi => '^0.3',
    }
);
crate(
    'tokio-signal' => '0.2.9',
    requires       => {
        futures          => '^0.1.11',
        mio              => '^0.6.14',
        'tokio-executor' => '^0.1.0',
        'tokio-io'       => '^0.1',
        'tokio-reactor'  => '^0.1',
        %{ $unix{requires} },
    },
    test => {
        tokio => '^0.1.8',
    }
);
