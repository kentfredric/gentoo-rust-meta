#!perl
use strict;
use warnings;

crate(
    'regex-syntax' => '0.6.12',
    features       => {
        default => ['unicode'],
        unicode => [
            map { "unicode-$_" } qw( age bool case gencat perl script segment )
        ],
        (
            map { ( "unicode-$_" => [] ) }
              qw( age bool case gencat perl script segment )
        )
    }
);

