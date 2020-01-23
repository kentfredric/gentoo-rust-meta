#!perl
use strict;
use warnings;

my %unixy = (
    test => {
        openssl => '^0.10',
    },
);
my %mac = (
    test => {
        'security-framework' => '^0.2',
    }
);
my %windows = (
    test => {
        schannel => '^0.1',
        winapi   => '^0.3',
    }
);
crate(
    'tokio-tls' => '0.3.0',
    requires    => {
        'native-tls' => '^0.2',
        tokio        => '^0.2',
    },
    test => {
        'cfg-if'   => '^0.1',
        env_logger => '^0.6',
        futures    => '^0.3',
        tokio      => '^0.2.0',
        %{ $unixy{test} },
    },
);
