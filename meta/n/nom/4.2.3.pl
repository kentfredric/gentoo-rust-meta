#!perl
use strict;
use warnings;

# Stripped upstream, patched out of Cargo.toml
my %benches = (
    criterion    => '^0.2',
    jemallocator => '^0.1',
);
crate(
    nom      => '4.2.3',
    optional => {
        lazy_static => '^1',
        regex       => '^1',
    },
    requires => {
        memchr => '^2',
    },
    build_requires => {
        version_check => '^0.1',
    },
    test     => {},
    features => {
        alloc            => [],
        default          => [qw( std )],
        regexp           => [qw( regex )],
        regexp_macros    => [qw( regexp lazy_static )],
        std              => [qw( alloc memchr/use_std )],
        'verbose-errors' => [qw( alloc )],
    }
);
