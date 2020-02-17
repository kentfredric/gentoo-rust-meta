#!perl
use strict;
use warnings;

my %cloudabi = (
    requires => {
        'cloudabi' => '^0.0.3',
    }
);
my %redox = (
    requires => {
        redox_syscall => '^0.1',
    }
);
my %unix = (
    requires => {
        libc => '^0.2.55',
    }
);
my %windows = (
    requires => {
        winapi => '^0.3',
    }
);
crate(
    parking_lot_core => '0.7.0',
    requires         => {
        'cfg-if' => '^0.1.5',
        smallvec => '^1',
        %{ $unix{requires} },
    },
    optional => {
        backtrace   => '^0.3.2',
        petgraph    => '^0.4.5',
        'thread-id' => '^3.2.0',
    },
    features => {
        deadlock_detection => [ 'petgraph', 'thread-id', 'backtrace' ],
        nightly            => [],
    }
);
