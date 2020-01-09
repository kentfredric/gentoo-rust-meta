#!perl
use strict;
use warnings;

my %benches = ( criterion => '^0.3', );
crate(
    base64 => '0.11.0',
    test   => {
        'doc-comment' => '^0.3',
        rand          => '^0.6.1',
    },
    features => {
        alloc   => [],
        default => [qw( std )],
        std     => [],
    }
);
