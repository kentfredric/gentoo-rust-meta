#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests Restricted
    rustls        => '0.16.0',
    missing_tests => 1,
    requires      => {
        base64 => '^0.10',
        ring   => '^0.16.5',
        sct    => '^0.6',
        webpki => '^0.21',
    },
    optional => {
        log => '^0.4.4',
    },
    test => {
        env_logger     => '^0.6.1',
        tempfile       => '^3',
        'webpki-roots' => '^0.17',
    },
    features => {
        dangerous_configuration => [],
        default                 => [qw( logging )],
        logging                 => [qw( log )],
        quic                    => [],
    }
);
