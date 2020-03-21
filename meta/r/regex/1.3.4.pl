#!perl
use strict;
use warnings;

crate(
    regex    => '1.3.4',
    requires => {
        'regex-syntax' => '^0.6.14',
    },
    optional => {
        'aho-corasick' => '^0.7.6',
        memchr         => '^2.2.1',
        thread_local   => '^1',
    },
    test => {
        'doc-comment' => '^0.3',
        lazy_static   => '^1',
        quickcheck    => '^0.8',
        rand          => '^0.6.5',
    },
    features => {
        default => [ 'std', 'perf', 'unicode' ],
        pattern => [],
        perf    => [ 'perf-cache', 'perf-dfa', 'perf-inline', 'perf-literal' ],
        'perf-cache'   => ['thread_local'],
        'perf-dfa'     => [],
        'perf-inline'  => [],
        'perf-literal' => [ 'aho-corasick', 'memchr' ],
        std            => [],
        unicode        => [
            map { "unicode-$_" } qw( age bool case gencat perl script segment )
        ],
        (
            map { ( "unicode-$_", ["regex-syntax/unicode-$_"] ) }
              qw( age bool case gencat perl script segment )
        ),
        unstable => ['pattern'],
        use_std  => ['std'],
    }
);
