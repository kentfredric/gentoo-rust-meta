#!perl
use strict;
use warnings;

my %benches = ( criterion => '^0.3', );
crate(
    'typed-arena' => '2.0.1',
    test          => {},
    features      => {
        default => [qw( std )],
        std     => [],
    }
);
