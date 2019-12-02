#!perl
use strict;
use warnings;

crate(
    url      => '1.7.2',
    optional => {
        encoding          => '^0.2',
        heapsize          => '>=0.4.1, <0.5',
        'rustc-serialize' => '^0.3',
        serde             => '>=0.6.1, <0.9',
    },
    requires => {
        idna               => '^0.1.0',
        matches            => '^0.1',
        'percent-encoding' => '^1',
    },
    test => {

        # benches/ only
        # bencher => '^0.1',
        'rustc-test' => '^0.3',
        serde_json   => '>=0.6.1, <0.9',
    },
    features => {
        heap_size      => [qw( heapsize )],
        query_encoding => [qw( encoding )]
      }

);
