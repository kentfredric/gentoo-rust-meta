#!perl
use strict;
use warnings;
my %benches  = ( criterion     => '^0.3', );
my %examples = ( 'typed-arena' => '^1.3.0', );
crate(
    html5ever => '0.25.1',
    requires  => {
        log         => '^0.4',
        mac         => '^0.1',
        markup5ever => '^0.10',
    },
    test           => {},
    build_requires => {
        'proc-macro2' => '^1',
        quote         => '^1',
        syn           => '^1',
    }
);
