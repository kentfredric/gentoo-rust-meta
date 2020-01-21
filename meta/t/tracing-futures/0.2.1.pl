#!perl
use strict;
use warnings;

crate(
    'tracing-futures' => '0.2.1',
    optional          => {
        futures        => '^0.3.0',
        'futures-task' => '^0.3',

        # futures => '^0.1',
        'pin-project'    => '^0.4',
        tokio            => '^0.1',
        'tokio-executor' => '^0.1',
    },
    requires => {
        tracing => '^0.1',
    },
    test => {
        tokio => '^0.1.22',
    },
    features => {
        default => [qw( std-future std )],

        # futures-01 => { futures => ^0.1 }
        'futures-03' => [qw( std-future futures futures-task )],
        std          => [qw( tracing/std )],
        'std-future' => [qw( pin-project )],
    }
);
