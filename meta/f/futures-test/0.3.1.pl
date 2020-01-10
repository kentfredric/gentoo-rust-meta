#!perl
use strict;
use warnings;

crate(
    'futures-test' => '0.3.1',
    requires       => {
        'futures-core'     => '^0.3.1',
        'futures-executor' => '^0.3.1',
        'futures-io'       => '^0.3.1',
        'futures-task'     => '^0.3.1',
        'futures-util'     => '^0.3.1',
        'pin-utils'        => '^0.1.0.4'    # 0.1.0-alpha.4
    },
    features => {
        default => [qw( std )],
        std     => [
            qw( futures-core/std futures-task/std futures-io/std futures-util/std futures-util/io futures-executor/std )
        ],
    }
);
