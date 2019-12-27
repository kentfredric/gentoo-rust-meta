#!perl
use strict;
use warnings;

crate(
    unicase  => '1.4.2',
    optional => {

        # broken, patched out
        #  heapsize        => '>=0.2.0, <0.4',
        #  heapsize_plugin => '^0.1.2',
    },
    build_requires => {
        version_check => '^0.1',
    },
    features => {

        # broken, patched out
        # heap_size => [qw( heapsize heapsize_plugin )],
    },
);
