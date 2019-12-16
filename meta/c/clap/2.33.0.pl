#!perl
use strict;
use warnings;

crate(
    clap     => '2.33.0',
    optional => {
        atty => '^0.2.2',

        # clippy      => '~0.0.166', # nightly
        strsim      => '^0.8',
        term_size   => '^0.3.0',
        vec_map     => '^0.8',
        'yaml-rust' => '^0.3.5',
        ansi_term   => '^0.11',    # not windows
    },
    requires => {
        bitflags        => '^1.0',
        textwrap        => '^0.11.0',
        'unicode-width' => '^0.1.4',
    },
    test => {

        # lazy_static    => '^1.3', # unused
        regex => '^1',

        #  'version-sync' => '^0.8', # unused
    },
    features => {
        color   => [qw( ansi_term atty )],
        debug   => [],
        default => [qw( suggestions color vec_map )],
        doc     => [qw( yaml )],

        # lints       => [qw( clippy )], # nightly
        nightly     => [],
        no_cargo    => [],
        suggestions => [qw( strsim )],
        unstable    => [],
        wrap_help   => [qw( term_size textwrap/term_size )],
        yaml        => [qw( yaml-rust )],
    }
);
