# copied over from JSON::PPdev::PC and modified to use JSON::PPdev
# copied over from JSON::PPdev::XS and modified to use JSON::PPdev

use Test::More;
use strict;
BEGIN { plan tests => 6 };

BEGIN { $ENV{PERL_JSON_BACKEND} = 0; }

use JSON::PPdev;


#########################
my ($js,$obj);
my $pc = new JSON::PP;

$js  = '{"foo":0}';
$obj = $pc->decode($js);
is($obj->{foo}, 0, "normal 0");

$js  = '{"foo":0.1}';
$obj = $pc->decode($js);
is($obj->{foo}, 0.1, "normal 0.1");


$js  = '{"foo":10}';
$obj = $pc->decode($js);
is($obj->{foo}, 10, "normal 10");

$js  = '{"foo":-10}';
$obj = $pc->decode($js);
is($obj->{foo}, -10, "normal -10");


$js  = '{"foo":0, "bar":0.1}';
$obj = $pc->decode($js);
is($obj->{foo},0,  "normal 0");
is($obj->{bar},0.1,"normal 0.1");

