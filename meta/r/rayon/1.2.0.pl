#!perl
use strict;
use warnings;

crate(
    # TODO
    rayon    => '1.2.0',
    requires => {
        'crossbeam-deque' => '^0.7',
        either            => '^1',
        'rayon-core'      => '^1.6.0',
    },
    test => {
        'doc-comment' => '^0.3',

        # example
        # docopt => '^1',
        lazy_static   => '^1',
        rand          => '^0.6',
        rand_xorshift => '^0.1',

        # example
        # serde => '^1',
        # serde_derive => '^1',
    }
);
