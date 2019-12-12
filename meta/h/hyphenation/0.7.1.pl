#!perl
use strict;
use warnings;

crate(
    hyphenation => '0.7.1',
    requires    => {
        atlatl              => '^0.1.2',
        bincode             => '^1.0',
        hyphenation_commons => '^0.7.1',
        serde               => '^1',
    },
    test => {
        lazy_static            => '^1.1',
        quickcheck             => '^0.7',
        'unicode-segmentation' => '^1.2',
    },
    build_requires => {

        # atlatl              => '^0.1.2',
        #  bincode             => '^1.0',
        #  hyphenation_commons => '^0.7.1',
        #  serde               => '^1',
    },
    optional => {

        # optional build_requires
        'pocket-resources'      => '^0.3',
        'unicode-normalization' => '^0.1',
    },
    features => {
        'build_dictionaries' => [],
        embed_all            => [qw( pocket-resources )],
        (
            map { ( $_ => [qw( unicode-normalization )] ) }
              qw( nfc nfd nfkc nfkd )
        ),
    }
);
