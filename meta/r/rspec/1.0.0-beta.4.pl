#!perl
use strict;
use warnings;

# Upstream: 1.0.0-beta.4
# Gentoo: 1.0.0_beta.4

my %patched_out = (
    optional => {

        # build_requires
        clippy => '^0.0.153',
    }
);
crate(
    rspec    => '1.0.0.4',
    optional => {
        expectest => '^0.9.1',
    },
    requires => {
        colored        => '^1.4.0',
        'derive-new'   => '^0.5.0',
        derive_builder => '^0.5.0',
        rayon          => '^0.8.1',
    },
    features => {
        default          => [],
        expectest_compat => [qw( expectest )],
    }
);
