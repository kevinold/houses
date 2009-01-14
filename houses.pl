#!/usr/bin/perl

use warnings;
use strict;
#Written by Kevin at Tue Jan 13 21:55:15 2009
#

use DBI;
my $dbh = DBI->connect("dbi:SQLite:houses.db");

#id
#mls
#address
#city
#zip
#bedrooms
#baths
#sqft
#price
#subdivision
#year_built
#acres

my $sth = $dbh->prepare("INSERT INTO houses VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
#$sth->bind_param(11111, '123 Anystreet');
$sth->execute(undef, 11111, '123 Anystreet', 'Nashville', 'TN', 3, 2, 2348, '179900', 'Greycrest', '1994', '0.4');
