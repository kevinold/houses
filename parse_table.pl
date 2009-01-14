#!/usr/bin/perl
use strict;
use WWW::Mechanize;
use URI::URL;
use HTML::TableExtract;
use List::MoreUtils qw/any/;
use HousesDB;
my $schema = HousesDB->connect('dbi:SQLite:houses.db');
my $agent = WWW::Mechanize->new( autocheck => 1 );
$agent->env_proxy();
$agent->get('http://www.mlsfinder.com/tn_mtrmls/kw_493/index.cfm?action=listing_detail&property_id=1032268');

my $c = $agent->content;
$c =~ m{<span class="detail_detail" style="font-size: 12px; font-weight: bold;">(.*?)</span>}s;
my $detail_detail = $1;
$detail_detail =~ s/\t+|\s{2,}//g;
$detail_detail =~ s/<div style="float: right;"><\/div>//;
my ($address, $city_state_zip) = split /\<br\>/, $detail_detail;
warn $city_state_zip;

my @items = ( 'Year Built','Square Feet','Total Full Baths','Total Half Baths', 'Bedrooms', 'Subdivision', 'Acres', 'Listing Price' );
my $table = HTML::TableExtract->new();
(my $content = $agent->content) =~ s/\&nbsp;?//g;
$table->parse($content);
my %data;
for my $ts ($table->table_states) {
    for my $row ($ts->rows) {
        if (any { defined($_) ? $row->[0] =~ $_ : undef } @items) {
            print join(", ", @$row), "\n";
            my $key = lc $row->[0];
            $key =~ s/[^A-Za-z ]//;
            $key =~ s/ /_/g;
            print $key, "\n";
            $data{$key} = $row->[1];
        }
    }
}

$schema->resultset('Houses')->create(\%data);
