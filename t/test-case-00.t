#!perl

use strict; use warnings;
use Test::More tests => 4;
use Map::Tube::London;

my $map = Map::Tube::London->new();

eval { $map->get_shortest_route(); };
like($@, qr/ERROR: Either FROM\/TO node is undefined/);

eval { $map->get_shortest_route('Bond Street'); };
like($@, qr/ERROR: Either FROM\/TO node is undefined/);

eval { $map->get_shortest_route('XYZ', 'Bond Street'); };
like($@, qr/ERROR: Received invalid FROM node 'XYZ'/);

eval { $map->get_shortest_route('Bond Street', 'XYZ'); };
like($@, qr/ERROR: Received invalid TO node 'XYZ'/);
