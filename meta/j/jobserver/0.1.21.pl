#!perl
use strict;
use warnings;

my %unix = (
    requires => {
        libc => '^0.2.50',
    }
);
crate(
    jobserver => '0.1.21',
    requires  => { %{ $unix{requires} } },
    test      => {
        futures         => '^0.1',
        num_cpus        => '^1',
        tempdir         => '^0.3',
        'tokio-core'    => '^0.1',
        'tokio-process' => '^0.2',
    }
);
