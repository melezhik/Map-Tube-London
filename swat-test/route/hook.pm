#!/usr/bin/perl

use strict; use warnings;
use Map::Tube::London;
my $r;

my $tube = Map::Tube::London->new;
while (<DATA>) {
    chomp;
    next if /^\#/;
    my ($description, $from, $to, $expected) = split /\|/;
    #is($tube->get_shortest_route($from, $to)->preferred, $expected, $description);
    $r.= $description.' '.$from.' => '.$to.' : '.( $tube->get_shortest_route($from, $to)->preferred )."\n"
}

set_response($r);

__DATA__
Route 1|Baker Street|Farringdon|Baker Street (Circle, Hammersmith & City, Metropolitan), Great Portland Street (Circle, Hammersmith & City, Metropolitan), Euston Square (Circle, Hammersmith & City, Metropolitan), King's Cross St. Pancras (Circle, Hammersmith & City, Metropolitan), Farringdon (Circle, Hammersmith & City, Metropolitan)
Route 2|Bank|Monument|Bank (Tunnel), Monument (Tunnel)
Route 3|Euston|King's Cross St. Pancras|Euston (Northern, Street, Victoria), King's Cross St. Pancras (Northern, Street, Victoria)
