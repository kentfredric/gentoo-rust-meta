#!perl
use strict;
use warnings;

crate(
    encoding_rs => '0.8.22',
    requires    => {
        'cfg-if' => '^0.1.0',
    },
    optional => {

        # packed_simd => '^0.3.3', # patched
        serde => '^1',
    },
    test => {
        bincode      => '^1',
        serde_derive => '^1',
        serde_json   => '^1',
    },
    features => {
        'fast-big5-hanzi-encode' => [],
        'fast-gb-hanzi-encode'   => [],
        'fast-hangul-encode'     => [],
        'fast-hanja-encode'      => [],
        'fast-kanji-encode'      => [],
        'fast-legacy-encode'     => [
            "fast-hangul-encode", "fast-hanja-encode",
            "fast-kanji-encode",  "fast-gb-hanzi-encode",
            "fast-big5-hanzi-encode"
        ],
        'less-slow-big5-hanzi-encode' => [],
        'less-slow-gb-hanzi-encode'   => [],
        'less-slow-kanji-encode'      => [],

        # 'simd-accel' => [ "packed_simd", "packed_simd/into_bits" ], # patched

    }
);
