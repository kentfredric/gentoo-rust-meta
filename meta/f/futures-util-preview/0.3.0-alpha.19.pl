#!perl
use strict;
use warnings;

# Upstream: 0.3.0-alpha.19
# Gentoo: 0.3.0_alpha19
crate(
    'futures-util-preview' => '0.3.0.19',
    optional               => {
        'futures-channel-preview'      => '=0.3.0.19',    # _alpha19 / -alpha.19
        'futures-io-preview'           => '=0.3.0.19',    # _alpha19 / -alpha.19
        'futures-join-macro-preview'   => '=0.3.0.19',
        'futures-select-macro-preview' => '=0.3.0.19',
        'futures-sink-preview'         => '=0.3.0.19',
        futures                        => '^0.1.25',
        memchr                         => '^2.2',
        'pin-utils'                    => '^0.1.0.4',     # _alpha4 / -alpha.4
        'proc-macro-hack'              => '^0.5.9',
        'proc-macro-nested'            => '^0.1.2',
        slab                           => '^0.4',
        'tokio-io'                     => '^0.1.9',
    },
    requires => {
        'futures-core-preview' => '=0.3.0.19',            # _alpha19 / -alpha.19
    },
    features => {
        alloc         => [qw( futures-core-preview/alloc )],
        'async-await' => [],
        block         => [],
        'cfg-target-has-atomic' =>
          [qw( futures-core-preview/cfg-target-has-atomic)],
        channel      => [qw( std futures-channel-preview )],
        compat       => [qw( std futures )],
        default      => [qw( std )],
        io           => [qw( std futures-io-preview memchr )],
        'io-compat'  => [qw( io compat tokio-io )],
        'join-macro' => [
            qw( async-await futures-join-macro-preview proc-macro-hack proc-macro-nested )
        ],
        read_initializer => [
            qw( io futures-io-preview/read_initializer futures-io-preview/unstable )
        ],
        'select-macro' => [
            qw( async-await futures-select-macro-preview proc-macro-hack proc-macro-nested )
        ],
        sink     => [qw( futures-sink-preview )],
        std      => [qw( alloc futures-core-preview/std slab )],
        unstable => [qw( futures-core-preview/unstable )],
    }
);

