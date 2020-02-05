#!perl
use strict;
use warnings;

my %stripped_bins = (
    matches      => '^0.1',
    num_cpus     => '^1.0',
    serde        => '^1.0',
    serde_derive => '^1.0',
    serde_json   => '^1.0',
    spmc         => '^0.3',

);
crate(
    hyper    => '0.13.2',
    requires => {
        bytes             => '^0.5',
        'futures-channel' => '^0.3',
        'futures-core'    => '^0.3',
        'futures-util'    => '^0.3',
        h2                => '^0.2.1',
        http              => '^0.2',
        'http-body'       => '^0.3.1',
        httparse          => '^1.0',
        itoa              => '^0.4.1',
        log               => '^0.4',
        'pin-project'     => '^0.4',
        time              => '^0.1',
        tokio             => '^0.2',
        'tower-service'   => '^0.3',
        want              => '^0.3',
    },
    optional => {
        net2 => '^0.2.32',
    },
    test => {
        'futures-util'    => '^0.3',
        pretty_env_logger => '^0.4',
        tokio             => '^0.2.2',
        'tokio-test'      => '^0.2',
        'tower-util'      => '^0.3',
        url               => '^1.0',
    },
    features => {
        __internal_happy_eyeballs_tests => [],
        default                         => [ "runtime", "stream" ],
        nightly                         => [],
        runtime                         => [ "tcp", "tokio/rt-core" ],
        stream                          => [],
        tcp => [ "net2", "tokio/blocking", "tokio/tcp", "tokio/time" ],
    }
);
