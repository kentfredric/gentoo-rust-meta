#!perl
use strict;
use warnings;

crate(
    publicsuffix => '1.5.4',
    requires     => {
        'error-chain' => '^0.12',
        idna          => '^0.2',
        lazy_static   => '^1.0',
        regex         => '^1.0',
        url           => '^2.0',
    },
    optional => {
        'native-tls' => '^0.2',
    },
    test => {

        # Upstream: 1.0.0-beta.3
        # Gentoo: 1.0.0_beta3

        rspec => '=1.0.0.3'
    },
    features => {
        default     => [qw( remote_list )],
        remote_list => [qw( native-tls )],
    }
);

