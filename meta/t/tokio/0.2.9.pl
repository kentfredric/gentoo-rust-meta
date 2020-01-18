#!perl
use strict;
use warnings;

my %unix = (
    optional => {
        libc                   => '^0.2.42',
        'mio-uds'              => '^0.6.5',
        'signal-hook-registry' => '^1.1.1',
    },
    features => {
        process => [ "io-driver", "libc", "signal", ],
        signal  => [
            "io-driver", "lazy_static",
            "libc",      "mio-uds",
            "signal-hook-registry",
        ],
    }
);
my %windows = (
    optional => {
        'mio-named-pipes' => '^0.1.6',
        winapi            => '^0.3.0',
    },
    features => {
        process => [
            "io-driver",                     "libc",
            "mio-named-pipes",               "signal",
            "winapi/consoleapi",             "winapi/minwindef",
            "winapi/threadpoollegacyapiset", "winapi/winerror"
        ],
        signal => [
            "io-driver",            "lazy_static",
            "libc",                 "mio-uds",
            "signal-hook-registry", "winapi/consoleapi",
            "winapi/minwindef"
        ],
    }
);
crate(
    tokio         => '0.2.9',
    missing_tests => 1,
    requires      => {
        bytes              => '^0.5.0',
        'pin-project-lite' => '^0.1.1',
    },
    optional => {
        fnv            => '^1.0.6',
        'futures-core' => '^0.3.0',
        iovec          => '^0.1.4',
        lazy_static    => '^1.0.2',
        memchr         => '^2.2',
        mio            => '^0.6.20',
        num_cpus       => '^1.8.0',
        slab           => '^0.4.1',
        'tokio-macros' => '^0.2.3',
        %{ $unix{optional} },
    },
    test => {
        futures      => '^0.3.0',
        loom         => '^0.2.13',
        proptest     => '^0.9.4',
        tempfile     => '^3.1.0',
        'tokio-test' => '^0.2.0',
    },
    features => {
        blocking => ["rt-core"],
        default  => [],
        dns      => ["rt-core"],
        fs       => ["rt-core"],
        full     => [
            "blocking", "dns",     "fs",      "io-driver",
            "io-util",  "io-std",  "macros",  "net",
            "process",  "rt-core", "rt-util", "rt-threaded",
            "signal",   "stream",  "sync",    "time"
        ],
        'io-driver' => [ "mio", "lazy_static" ],
        'io-std'    => ["rt-core"],
        'io-util'   => ["memchr"],
        macros      => ["tokio-macros"],
        net         => [ "dns", "tcp", "udp", "uds" ],

        'rt-core'     => [],
        'rt-threaded' => [ "num_cpus", "rt-core" ],
        'rt-util'     => [],

        stream      => ["futures-core"],
        sync        => ["fnv"],
        tcp         => [ "io-driver", "iovec" ],
        'test-util' => [],
        time        => ["slab"],
        udp         => ["io-driver"],
        uds         => [ "io-driver", "mio-uds", "libc" ],
        %{ $unix{features} },
    }
);
