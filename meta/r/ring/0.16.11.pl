#!perl
use strict;
use warnings;

my %non_ios_arm_x86 = (
    requires => {
        spin => '^0.5.2',
    }
);
my %wasm = (
    requires => {
        'web-sys' => '^0.3.25',
    },
    test => {
        'wasm-bindgen-test' => '^0.2.48',
    }
);
my %unix_family = (
    optional => {
        lazy_static => '^1.3',
    }
);
my %linux_family = (
    requires => {
        libc => '^0.2.48',
    }
);
my %windows = (
    requires => {
        libc   => '^0.2.48',
        winapi => '^0.3.7',
    }
);
crate(
    ring     => '0.16.11',
    requires => {
        untrusted => '^0.7',
        %{ $non_ios_arm_x86{requires} },
        %{ $linux_family{requires} },
    },
    optional       => { %{ $unix_family{optional} } },
    build_requires => {
        cc => '^1.0.37',
    },
    features => {
        alloc                => [],
        default              => [qw( alloc dev_urandom_fallback )],
        dev_urandom_fallback => [qw( lazy_static )],
        internal_benches     => [],
        slow_tests           => [],
        std                  => [qw( alloc )],
        test_logging         => [],
    },
    test => {}
);
