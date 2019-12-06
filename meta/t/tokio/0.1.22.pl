#!perl
use strict;
use warnings;

crate(
    tokio    => '0.1.22',
    requires => {
        bytes   => '^0.4',
        futures => '^0.1.20',
    },
    optional => {
        mio                    => '^0.6.14',
        num_cpus               => '^1.8.0',
        'tokio-codec'          => '^0.1',
        'tokio-current-thread' => '^0.1.6',
        'tokio-executor'       => '^0.1.7',
        'tokio-fs'             => '^0.1.6',
        'tokio-io'             => '^0.1.6',
        'tokio-reactor'        => '^0.1.1',
        'tokio-sync'           => '^0.1.5',
        'tokio-tcp'            => '^0.1.0',
        'tokio-threadpool'     => '^0.1.14',
        'tokio-timer'          => '^0.2.8',
        'tokio-udp'            => '^0.1.0',
        'tracing-core'         => '^0.1',
        'tokio-uds'            => '^0.2.1',
    },
    test => {
        env_logger => '^0.5',

        # flate2            => '^1',  # unused
        # 'futures-cpupool' => '^0.1', # example
        # http              => '^0.1', # example
        # httparse          => '^1', # example
        libc     => '^0.2',
        num_cpus => '^1.0',

        # serde             => '^1', # example
        # serde_derive      => '^1', # example
        # serde_json        => '^1', # example
        # time              => '^0.1', # example
    },
    features => {
        codec   => [qw( io tokio-codec )],
        default => [qw( codec fs io reactor rt-full sync tcp timer udp uds )],
        'experimental-tracing' => [qw( tracing-core )],
        fs                     => [qw( tokio-fs )],
        io                     => [qw( bytes tokio-io )],
        reactor                => [qw( io mio tokio-reactor )],
        'rt-full'              => [
            qw( num_cpus reactor timer tokio-current-thread tokio-executor tokio-threadpool )
        ],
        sync  => [qw( tokio-sync )],
        tcp   => [qw( tokio-tcp )],
        timer => [qw( tokio-timer )],
        udp   => [qw( tokio-udp )],
        uds   => [qw( tokio-uds )],
    }
);
