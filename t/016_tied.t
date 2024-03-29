# copied over from JSON::PPdev::XS and modified to use JSON::PPdev

use strict;
use Test::More;
BEGIN { plan tests => 2 };

BEGIN { $ENV{PERL_JSON_BACKEND} = 0; }

use JSON::PPdev;
use Tie::Hash;
use Tie::Array;

my $js = JSON::PP->new;

tie my %h, 'Tie::StdHash';
%h = (a => 1);

ok ($js->encode (\%h) eq '{"a":1}');

tie my @a, 'Tie::StdArray';
@a = (1, 2);

ok ($js->encode (\@a) eq '[1,2]');
