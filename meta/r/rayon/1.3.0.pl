#!perl
use strict;
use warnings;

my %examples = (
    docopt => '^1',
    serde  => '^1.0.85',
);
crate(
    rayon    => '1.3.0',
    requires => {
        'crossbeam-deque' => '^0.7.2',
        either            => '^1',
        'rayon-core'      => '^1.7.0',
    },
    test => {
        'doc-comment' => '^0.3',
        lazy_static   => '^1',
        rand          => '^0.7',
        rand_xorshift => '^0.2',
    }
);
