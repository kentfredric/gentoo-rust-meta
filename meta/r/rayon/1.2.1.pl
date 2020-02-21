#!perl
use strict;
use warnings;

my %examples = (
    docopt       => '^1',
    serde        => '^1',
    serde_derive => '^1',
);
crate(
    rayon    => '1.2.1',
    requires => {
        'crossbeam-deque' => '^0.7.2',
        either            => '^1',
        'rayon-core'      => '^1.6.1',
    },
    test => {
        'doc-comment' => '^0.3',
        lazy_static   => '^1',
        rand          => '^0.6',
        rand_xorshift => '^0.1',
    }
);
