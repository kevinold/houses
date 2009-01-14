#!/usr/bin/perl

use warnings;
use strict;
#Written by Kevin at Tue Jan 13 21:55:15 2009
#

use DBI;
use Data::Dumper;

my @test = (undef, 11111, '123 Anystreet', 'Nashville', 'TN', 3, 2, 2348, '179900', 'Greycrest', '1994', '0.4');
add_to_db(@test);

sub add_to_db {
    my $house = shift;
    print Dumper($house);
    my $dbh = DBI->connect("dbi:SQLite:houses.db");

    #id mls address city zip bedrooms baths sqft price subdivision year_built acres
    my $sth = $dbh->prepare("INSERT INTO houses VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");

    $sth->execute(@$house);
    #$sth->execute(undef, 11111, '123 Anystreet', 'Nashville', 'TN', 3, 2, 2348, '179900', 'Greycrest', '1994', '0.4');
}
