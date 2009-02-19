use strict;
use warnings;
#use Test::More tests => 3;
use Test::More 'no_plan';

BEGIN { use_ok 'House' }

my $house = House->new;
isa_ok($house, 'House');

ok( grep 1016692, $house->finalist, '1016692 is the finalist!' );
