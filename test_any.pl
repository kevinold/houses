#!/usr/bin/perl -w
use strict;
use List::MoreUtils qw/any/;

my @items = ( 'Year Built','Square Feet','Total Full Baths','Total Half Baths', 'Bedrooms' );
if (any { 'ear Built' =~ $_ } @items) {
    print 'year built matches', "\n";
}
