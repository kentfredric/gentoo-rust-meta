#!perl
use strict;
use warnings;

crate(
    'ccache_stats_reader' => '0.1.1',
    requires              => {
        chrono => '^0.4',
    }
);
crate(
    'rand'   => '0.3.23',
    requires => {
        libc => '^0.2',
        rand => '^0.4',
    }
);
crate(
    'sval' => '0.4.5',
    test   => {

        # WIP
        'serde'       => '^1',
        'smallvec'    => '^0.6',
        'sval_derive' => '^0.4.5',
        'quickcheck'  => '^0.8',
    }
);
crate(
    'serde_test' => '1.0.101',
    requires     => {
        'serde' => '^1.0.60'
    },
    test => {
        serde_derive => '^1.0',
    }
);
crate(
    'custom_derive' => '0.1.7',
    test            => {
        'rustc-serialize' => '^0.3.15'
    }
);
crate(
    'conv'   => '0.3.3',
    requires => {
        'custom_derive' => '^0.1.2',
    },
    test => {

        # WIP
        quickcheck => 'range_excl(0.2.21, 0.2.25)',
    },
);
crate(
    'float-ord' => '0.2.0',
    test        => {
        rand => '^0.3',
    }
);
crate(
    'average' => '0.9.4',
    requires  => {
        'conv'        => '^0.3',
        'float-ord'   => '^0.2',
        'num-integer' => '^0.1',
        'num-traits'  => '^0.2',
    },
    test => {
        'serde'           => '^1',
        'serde-big-array' => '^0.1.4',
        'serde_derive'    => '^1',
        'bencher'         => '^0.1',
        'quantiles'       => '^0.7',
        rand              => '^0.6',
        serde_json        => '^1',
        'streaming-stats' => '^0.2',
    }
);
crate(
    'rand_xoshiro' => '0.1.0',
    requires       => {
        'byteorder' => '^1',
        'rand_core' => '^0.3',
    },
    test => {
        'rand' => '^0.6',
    }
);
crate(
    'bincode' => '1.2.0',
    requires  => {
        'byteorder' => '^1.3.0',
        'serde'     => '^1.0.63',
        'autocfg'   => '^0.1.2',
    },
    test => {
        'serde_bytes'  => '^0.11',
        'serde_derive' => '^1.0.27',
    }
);
crate(
    'serde-big-array' => '0.1.5',
    requires          => {
        'serde_derive' => '^1.0',
        'serde'        => '^1.0',
    },
    test => {
        serde_json => '^1.0'
    }
);
crate( 'bencher' => '0.1.5' );
crate(
    'quantiles' => '0.7.1',
    test        => {

        # WIP
        serde        => '^1',
        serde_derive => '^1',
        quickcheck   => '^0.5',
    }
);
crate(
    serde_json => '1.0.40',
    requires   => {
        'itoa'  => '^0.4.3',
        'ryu'   => '^1.0',
        'serde' => '^1.0.60',
    },
    test => {

        # WIP
        indexmap       => '^1.0',
        automod        => '^0.1',
        'select-rustc' => '^0.1',
        'serde_bytes'  => '^0.11',
        serde_derive   => '^1.0',
        serde_stacker  => '^0.1',
        trybuild       => '^1.0',

    }
);
crate(
    'ryu'    => '1.0.0',
    optional => {
        'no-panic' => '^0.1',
    },
    test => {
        'num_cpus' => '^1.8',
        'rand'     => '^0.5',

    }
);
crate(
    'proc-macro2' => '1.0.4',
    requires      => {
        'unicode-xid' => '^0.2',
    },
    test => {
        quote => '^1',
    },
);
crate(
    'streaming-stats' => '0.2.2',
    requires          => {
        'num-traits' => '^0.2',
    }
);
crate(
    'serde_bytes' => '0.11.2',
    requires      => {
        'serde' => '^1',
    },
    test => {
        'bincode'      => '^1',
        'serde_derive' => '^1',
        'serde_test'   => '^1',
    },
);
crate(
    'rand_hc' => '0.2.0',
    requires  => {
        'rand_core' => '^0.5',
    }
);
crate(
    'getrandom' => '0.1.12',
    requires    => {
        'cfg-if'                   => '^0.1',
        'rustc-std-workspace-core' => '^1',
        libc                       => '^0.2.62',
    },
    test => {
        'log' => '^0.4'
    }
);

crate(
    'rand'   => '0.7.2',
    requires => {
        getrandom   => '^0.1.1',
        libc        => '^0.2.22',
        rand_chacha => '^0.2.1',
        rand_core   => '^0.5.1',
        log         => '^0.4',
    },
    test => {
        rand_hc       => '^0.2',
        rand_pcg      => '^0.2',
        rand_isaac    => '^0.2',
        rand_xorshift => '^0.2',
        rand_xoshiro  => '^0.4',

    }
);
crate(
    'rand_pcg' => '0.2.0',
    requires   => {
        'rand_core' => '^0.5',
        'autocfg'   => '^0.1',
    },
    test => {
        'serde'   => '^1',
        'bincode' => '^1.1.2',
    }
);
crate(
    'rand_isaac' => '0.2.0',
    requires     => {
        'rand_core' => '^0.5'
    },
    test => {
        'bincode' => '^1',
        'serde'   => '^1',
    },
);
crate(
    'rand_xorshift' => '0.2.0',
    requires        => {
        'rand_core' => '^0.5'
    },
    test => {
        'bincode' => '^1',
        'serde'   => '^1',
    },
);
crate(
    'rand_xoshiro' => '0.4.0',
    requires       => {
        'rand_core' => '^0.5',
    },
    test => {
        'bincode' => '^1',
        serde     => '^1',
    }
);
crate( 'ppv-lite86' => '0.2.5' );
crate(
    'stream-cipher' => '0.3.2',
    requires        => {
        'generic-array' => '^0.12',
    },
    test => {
        'blobby' => '^0.1',
    }
);
crate(
    'blobby' => '0.1.2',
    test     => {
        'byteorder' => '^1',
        'hex'       => '^0.3',
    }
);
crate( 'hex' => '0.3.2' );
crate(
    'c2-chacha' => '0.2.2',
    requires    => {
        byteorder       => '^1.2',
        'ppv-lite86'    => '^0.2.1',
        'stream-cipher' => '^0.3',
    },
    test => {
        'hex-literal' => '^0.1',
    },
);
crate(
    'rand_chacha' => '0.2.1',
    requires      => {
        'rand_core' => '^0.5',
        'c2-chacha' => '^0.2.2',
    }
);
crate(
    'tempfile' => '3.1.0',
    requires   => {
        'cfg-if'         => '^0.1',
        'rand'           => '^0.7',
        'remove_dir_all' => '^0.5',
    }
);

crate(
    'trybuild' => '1.0.16',
    requires   => {
        'glob'        => '^0.3',
        'lazy_static' => '^1.3',
        'serde'       => '^1.0',
        'serde_json'  => '^1.0',
        'termcolor'   => '^1.0',
        'toml'        => '^0.5',
    }
);
crate(
    automod  => '0.1.2',
    requires => {
        'proc-macro2' => '^1.0',
        quote         => '^1.0',
        syn           => '^1.0',
    }
);
crate(
    'select-rustc' => '0.1.2',
    requires       => {
        'proc-macro2' => '^0.4',
        quote         => '^0.6.8',
        syn           => '^0.15.25',
    }
);
crate(
    stacker  => '0.1.5',
    requires => {
        'cfg-if' => '^0.1.6',
        libc     => '^0.2.45',
        cc       => '^1.0',
    }
);
crate(
    serde_stacker => '0.1.0',
    requires      => {
        stacker => '^0.1',
    },
    test => {
        serde_json => '^1.0',
    }
);
crate( 'proc-macro-hack-impl' => '0.4.2' );
crate(
    'proc-macro-hack' => '0.4.2',
    requires          => {
        'proc-macro-hack-impl' => '^0.4',
    },
    test => {
        'demo-hack'      => '^0.0.4',
        'demo-hack-impl' => '^0.0.4',
    },
);
crate(
    'demo-hack' => '0.0.4',
    requires    => {
        'proc-macro-hack' => '^0.4',
        'demo-hack-impl'  => '^0.0.4',
    }
);
crate(
    'demo-hack-impl' => '0.0.4',
    requires         => {
        'proc-macro-hack' => '^0.4',
    }
);

crate(
    'hex-literal' => '0.1.4',
    requires      => {
        'hex-literal-impl' => '^0.1',
        'proc-macro-hack'  => '^0.4',
    }
);
crate(
    'hex-literal-impl' => '0.1.2',
    requires           => {
        'proc-macro-hack' => '^0.4',
    }
);
crate( fnv => '1.0.6' );
crate(
    'log'    => '0.3.9',
    requires => {
        log => '^0.4',
    },
);
crate(
    quickcheck => '0.2.24',
    requires   => {
        log  => '^0.3',
        rand => '^0.3',
    }
);
crate( 'ucd-util' => '0.1.5' );
crate(
    'regex-syntax' => '0.5.6',
    requires       => {
        'ucd-util' => '^0.1',
    }
);

#### WIP

crate(
    cc       => '1.0.38',
    requires => {
        tempdir => '^0.3',
    },
    test => {
        rayon => '^1.0',
    }
);
crate(
    quickcheck => '0.8.5',

    #    missing    => 1,
    requires => {
        'rand'      => '^0.6.5',
        'rand_core' => '^0.4.0',
    },
    test => {
        'env_logger' => '^0.6.0',
        'log'        => '^0.4',
    }
);
crate(
    itertools => '0.8.0',
    requires  => {
        either => '^1.0',
    },
    test => {
        permutohedron => '^0.2',
        quickcheck    => '^0.7',
        rand          => '^0.6',
    },
);
crate(
    permutohedron => '0.2.4',
    missing       => 1,
);
crate(
    quickcheck => '0.7.2',
    missing    => 1,
);
crate(
    quickcheck => '0.5.0',
    requires   => {
        log  => '^0.3',
        rand => '^0.3',
    },
    test => {
        env_logger => '^0.4',
    }
);
crate(
    sval_derive => '0.4.5',
    missing     => 1,
);
crate(
    env_logger => '0.4.3',
    missing    => 1,
    requires   => {
        log => '^0.3',
    },
    test => {
        regex => '^0.2',
    }
);
crate(
    regex    => '0.2.11',
    missing  => 1,
    requires => {
        memchr         => '^2.0.0',
        'regex-syntax' => '^0.5.6',
        thread_local   => '^0.3.2',
        'utf8-ranges'  => '^1.0.0',
    },
    test => {
        lazy_static => '^1',
        quickcheck  => '^0.6',
        rand        => '^0.4',
    }
);
crate(
    quickcheck => '0.6.2',
    missing    => 1,
);
crate(
    'utf8-ranges' => '1.0.4',
    missing       => 1,
    test          => {
        'doc-comment' => '^0.3',
        quickcheck    => '^0.8',
    }
);
