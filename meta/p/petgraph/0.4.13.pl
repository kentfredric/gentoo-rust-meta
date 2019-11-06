#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Missing tests and features
    petgraph        => '0.4.13',
    missing_tests   => 1,
    missing_options => 1,
    requires        => {
        fixedbitset => '^0.1.4',
    },
    optional => {
        ordermap     => '^0.3.0',
        quickcheck   => '^0.4',
        serde        => '^1',
        serde_derive => '^1',
    },
    test => {
        defmac    => '^0.1',
        itertools => '^0.7',
        odds      => '^0.2.19',
        rand      => '^0.3',
    },
    features => {
        all          => [qw( unstable quickcheck stable_graph graphmap )],
        default      => [qw( graphmap stable_graph )],
        generate     => [],
        graphmap     => [qw( ordermap )],
        'serde-1'    => [qw( serde serde_derive )],
        stable_graph => [],
        unstable     => [qw( generate )],
      }

);
