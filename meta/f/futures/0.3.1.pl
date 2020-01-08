#!perl
use strict;
use warnings;

crate(
    futures  => '0.3.1',
    requires => {
        'futures-channel'  => '^0.3.1',
        'futures-core'     => '^0.3.1',
        'futures-executor' => '^0.3.1',
        'futures-io'       => '^0.3.1',
        'futures-sink'     => '^0.3.1',
        'futures-task'     => '^0.3.1',
        'futures-util'     => '^0.3.1',
    },
    test => {
        assert_matches => '^1.3.0',
        'pin-utils'    => '^0.1',
        tokio          => '^0.1.11',
    },
    features => {
        alloc => [
            qw( futures-core/alloc futures-task/alloc futures-channel/alloc futures-util/alloc )
        ],
        'async-await' =>
          [qw( futures-util/async-await futures-util/async-await-macro )],
        block                   => [qw( futures-util/block )],
        'cfg-target-has-atomic' => [
            qw( futures-core/cfg-target-has-atomic futures-task/cfg-target-has-atomic
              futures-channel/cfg-target-has-atomic futures-util/cfg-target-has-atomic )
        ],
        compat      => [qw( std futures-util/compat )],
        default     => [qw( std async-await executor )],
        executor    => [qw( std futures-executor/std )],
        'io-compat' => [qw( compat futures-util/compat )],
        'read-initializer' =>
          [qw( futures-io/read-initializer futures-util/read-initializer )],
        std => [
            qw( alloc futures-core/std futures-task/std futures-io/std futures-sink/std futures-util/std futures-util/io futures-util/channel )
        ],
        'thread-pool' => [qw( executor futures-executor/thread-pool )],
        unstable      => [
            qw( futures-core/unstable futures-task/unstable futures-channel/unstable futures-io/unstable futures-util/unstable )
        ],
    },
);
