#!perl
use strict;
use warnings;

# redox, or non-macos unix
my %unixy_one = (
    requires => {
        lazy_static => '^1.2',
    }
);
my %not_ios = (
    requires => {
        spin => '^0.5.0',
    }
);
my %windows = (
    requires => {
        winapi => '^0.3.6',
    }
);

crate(
    ring     => '0.14.6',
    requires => {
        libc      => '^0.2.48',
        untrusted => '^0.6.2',
        %{ $unixy_one{requires} },
        %{ $not_ios{requires} }
    },
    build_requires => {
        cc => '^1.0.26',
    },
    features => {
        default              => [qw( use_heap dev_urandom_fallback )],
        dev_urandom_fallback => [],
        internal_benches     => [],
        slow_tests           => [],
        test_logging         => [],
        use_heap             => [],
    }
);
