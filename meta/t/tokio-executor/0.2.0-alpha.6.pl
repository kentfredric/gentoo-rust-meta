#!perl
use strict;
use warnings;

# Upstream: 0.2.0-alpha.6
# Gentoo: 0.2.0_alpha6
crate(
    'tokio-executor' => '0.2.0.6',
    optional         => {
        'crossbeam-channel'    => '^0.3.8',
        'crossbeam-deque'      => '^0.7.0',
        'crossbeam-queue'      => '^0.1.0',
        'crossbeam-utils'      => '^0.6.4',
        'futures-core-preview' => '=0.3.0.19',  # 0.3.0-alpha.19 / 0.3.0_alpha19
        lazy_static            => '^1',
        num_cpus               => '^1.2',
        slab                   => '^0.4.1',
        'tokio-sync'           => '=0.2.0.6',   # 0.2.0-alpha.6 / 0.2.0_alpha6
        tracing                => '^0.1.5',
    },
    requires => {
        'futures-util-preview' => '=0.3.0.19'   # 0.3.0-alpha.19 / 0.3.0_alpha19
    },
    features => {
        blocking         => [qw( tokio-sync lazy_static )],
        'current-thread' => [qw( crossbeam-channel )],
        threadpool       => [
            qw(
              tokio-sync crossbeam-deque crossbeam-queue crossbeam-utils
              futures-core-preview num_cpus lazy_static slab
              )
        ]
    }
);

