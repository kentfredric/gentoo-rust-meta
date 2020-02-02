#!perl
use strict;
use warnings;

my %examples = (
    docopt       => '^1',
    serde        => '^1',
    serde_derive => '^1',
);
my %unix = (
    optional => {
        'openssl-probe' => '^0.1',
        'openssl-sys'   => '^0.9',
    },
    default_features => [qw( https )],
    features         => {
        https => [qw( libgit2-sys/https openssl-sys openssl-probe )],
        'vendored-openssl' => [qw( openssl-sys/vendored )],
    },
);
crate(
    git2     => '0.11.0',
    requires => {
        bitflags      => '^1.1.0',
        libc          => '^0.2',
        'libgit2-sys' => '^0.10.0',
        log           => '^0.4.8',
        url           => '^2',
    },
    optional => { %{ $unix{optional} } },
    test     => {
        tempfile    => '^3.1.0',
        'thread-id' => '^3.3.0',
        time        => '^0.1.39',
    },
    features => {
        default =>
          [ qw( ssh ssh_key_from_memory ), @{ $unix{default_features} } ],
        %{ $unix{features} },
        ssh                 => [qw( libgit2-sys/ssh )],
        ssh_key_from_memory => [qw( libgit2-sys/ssh_key_from_memory )],
        unstable            => [],

    }
);
