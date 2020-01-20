#!perl
use strict;
use warnings;

my %examples = (
    docopt            => '^0.7',
    'rustc-serialize' => '^0.3',
);
my %broken_tests = (
    compiletest_rs => '^0.2.1',

);
crate(
    rayon         => '0.8.2',
    missing_tests => 1,
    requires      => {
        'rayon-core' => '^1.2',
    },
    test => {
        futures => '^0.1.7',
    }
);
