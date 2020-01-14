#!perl
use strict;
use warnings;

# patched out
my %benches = ( criterion => '^0.2', );
my %broken_tests = (
    compiletest_rs => '^0.3.19',

);
crate(
    'proptest-derive' => '0.1.2',
    requires          => {
        'proc-macro2' => '^0.4',
        quote         => '^0.6',
        syn           => '^0.15.17',
    },
    test => {
        proptest => '^0.9.4',
    }
);
