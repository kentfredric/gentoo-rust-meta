#!perl
use strict;
use warnings;

crate(
    'clang-sys' => '0.29.0',
    requires    => {
        glob => '^0.3',
        libc => '^0.2.66',
    },
    optional => {
        libloading => '^0.5.2',
    },
    features => {
        clang_3_5 => [],
        clang_3_6 => ["gte_clang_3_6"],
        clang_3_7 => [ "gte_clang_3_6", "gte_clang_3_7" ],
        clang_3_8 => [ "gte_clang_3_6", "gte_clang_3_7", "gte_clang_3_8" ],
        clang_3_9 => [
            "gte_clang_3_6", "gte_clang_3_7", "gte_clang_3_8", "gte_clang_3_9"
        ],
        clang_4_0 => [
            "gte_clang_3_6", "gte_clang_3_7",
            "gte_clang_3_8", "gte_clang_3_9",
            "gte_clang_4_0"
        ],
        clang_5_0 => [
            "gte_clang_3_6", "gte_clang_3_7",
            "gte_clang_3_8", "gte_clang_3_9",
            "gte_clang_4_0", "gte_clang_5_0"
        ],
        clang_6_0 => [
            "gte_clang_3_6", "gte_clang_3_7",
            "gte_clang_3_8", "gte_clang_3_9",
            "gte_clang_4_0", "gte_clang_5_0",
            "gte_clang_6_0"
        ],
        clang_7_0 => [
            "gte_clang_3_6", "gte_clang_3_7",
            "gte_clang_3_8", "gte_clang_3_9",
            "gte_clang_4_0", "gte_clang_5_0",
            "gte_clang_6_0", "gte_clang_7_0"
        ],
        clang_8_0 => [
            "gte_clang_3_6", "gte_clang_3_7",
            "gte_clang_3_8", "gte_clang_3_9",
            "gte_clang_4_0", "gte_clang_5_0",
            "gte_clang_6_0", "gte_clang_7_0",
            "gte_clang_8_0"
        ],
        clang_9_0 => [
            "gte_clang_3_6", "gte_clang_3_7",
            "gte_clang_3_8", "gte_clang_3_9",
            "gte_clang_4_0", "gte_clang_5_0",
            "gte_clang_6_0", "gte_clang_7_0",
            "gte_clang_8_0", "gte_clang_9_0",

        ],
        gte_clang_3_6 => [],
        gte_clang_3_7 => [],
        gte_clang_3_8 => [],
        gte_clang_3_9 => [],
        gte_clang_4_0 => [],
        gte_clang_5_0 => [],
        gte_clang_6_0 => [],
        gte_clang_7_0 => [],
        gte_clang_8_0 => [],
        gte_clang_9_0 => [],
        runtime       => ["libloading"],
        static        => [],

    }
);
