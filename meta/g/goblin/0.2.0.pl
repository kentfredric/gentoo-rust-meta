#!perl
use strict;
use warnings;

crate(
    goblin   => '0.2.0',
    optional => {
        log => '^0.4',
    },
    requires => {
        plain  => '^0.2.3',
        scroll => '^0.10',
    },
    features => {
        alloc   => [ "scroll/derive", "log" ],
        archive => ["alloc"],
        default => [
            "std",    "elf32", "elf64", "mach32",
            "mach64", "pe32",  "pe64",  "archive",
            "endian_fd"
        ],
        elf32     => [],
        elf64     => [],
        endian_fd => ["alloc"],
        mach32    => [ "alloc", "endian_fd" ],
        mach64    => [ "alloc", "endian_fd" ],
        pe32      => [ "alloc", "endian_fd" ],
        pe64      => [ "alloc", "endian_fd" ],
        std       => [ "alloc", "scroll/std" ],
    }
);

