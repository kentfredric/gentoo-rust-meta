#!perl
use strict;
use warnings;

crate(
    petgraph => '0.5.0',
    requires => {
        fixedbitset => '^0.2.0',
        indexmap    => '^1.0.2',
    },
    optional => {
        quickcheck   => '^0.8',
        serde        => '^1',
        serde_derive => '^1',
    },
    test => {
        defmac    => '^0.1',
        itertools => '^0.8',
        odds      => '^0.2.19',
        rand      => '^0.5.5',
    },
    features => {
        all => [qw( unstable quickcheck matrix_graph stable_graph graphmap )],
        default      => [qw( graphmap stable_graph matrix_graph )],
        generate     => [],
        graphmap     => [],
        matrix_graph => [],
        'serde-1'    => [qw( serde serde_derive )],
        stable_graph => [],
        unstable     => [qw( generate )],
      }

);
