#!perl
use strict;
use warnings;

my %added = (
    test => {
        futures        => '^0.3.2',
        'futures-test' => '^0.3',
    }
);
crate(
    'futures-util' => '0.3.4',
    optional       => {
        'futures-channel'   => '^0.3.4',
        'futures-io'        => '^0.3.4',
        'futures-macro'     => '^0.3.4',
        'futures-sink'      => '^0.3.4',
        'futures'           => '^0.1.25',    # futures_01
        memchr              => '^2.2',
        'proc-macro-hack'   => '^0.5.9',
        'proc-macro-nested' => '^0.1.2',
        slab                => '^0.4',
        'tokio-io'          => '^0.1.9',
    },
    requires => {
        'futures-core' => '^0.3.4',
        'futures-task' => '^0.3.4',
        'pin-utils'    => '^0.1.0',
    },
    test     => { %{ $added{test} } },
    features => {
        alloc         => [qw( futures-core/alloc futures-task/alloc )],
        'async-await' => [],
        'async-await-macro' =>
          [qw( async-await futures-macro proc-macro-hack proc-macro-nested )],
        block                   => [],
        'cfg-target-has-atomic' => [
            qw( futures-core/cfg-target-has-atomic futures-task/cfg-target-has-atomic )
        ],
        channel     => [qw( std futures-channel )],
        compat      => [qw( std futures )],
        default     => [qw( std async-await async-await-macro )],
        io          => [qw( std futures-io memchr )],
        'io-compat' => [qw( io compat tokio-io )],
        'read-initializer' =>
          [qw( io futures-io/read-initializer futures-io/unstable )],
        sink     => [qw( futures-sink )],
        std      => [qw( alloc futures-core/std futures-task/std slab )],
        unstable => [qw( futures-core/unstable futures-task/unstable )],
    }
);
