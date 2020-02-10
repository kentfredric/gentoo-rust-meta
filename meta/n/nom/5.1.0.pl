#!perl
use strict;
use warnings;

# Stripped upstream, patched out of Cargo.toml
my %benches = (
    criterion    => '^0.2',
    jemallocator => '^0.1',
);
crate(
    nom      => '5.1.0',
    optional => {
        lazy_static    => '^1',
        'lexical-core' => '^0.4.0',
        regex          => '^1',
    },
    requires => {
        memchr => '^2',
    },
    build_requires => {
        version_check => '^0.1',
    },
    test => {
        'doc-comment' => '^0.3',
    },
    features => {
        alloc         => [],
        default       => [qw( std lexical )],
        lexical       => [qw( lexical-core )],
        regexp        => [qw( regex )],
        regexp_macros => [qw( regexp lazy_static )],
        std           => [qw( alloc memchr/use_std )],
    }
);
