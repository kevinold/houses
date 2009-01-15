#!/usr/bin/perl
use strict;
use WWW::Mechanize;
use URI::URL;
use HTML::TableExtract;
use List::MoreUtils qw/any/;
use Data::Dumper;
use YAML qw(LoadFile Dump);
use HousesDB;

# TODO:
# - Put mechanzie code into get_kw()
# - Pull in YAML, loop through MLS #'s and call get_kw() if MLS # isn't found
# - Add Getopt::Long flags to force and update on certain MLS # (to reflect price change, etc)

my $yaml = LoadFile('houses.yml');
my $finalists = $yaml->{finalists};
my $havent_seen = $yaml->{havent_seen};
warn Dumper($finalists);
warn Dumper($havent_seen);

__END__
sub get_kw() {
    my $mls = shift;
    my %data;
    my $schema = HousesDB->connect('dbi:SQLite:houses.db');
    my $agent = WWW::Mechanize->new(autocheck => 1);
    $agent->env_proxy();
    $agent->get('http://www.mlsfinder.com/tn_mtrmls/kw_493/index.cfm?action=listing_detail&property_id=1032268');

    my $c = $agent->content;
    $c =~ m{<span class="detail_detail" style="font-size: 12px; font-weight: bold;">(.*?)</span>}s;
    my $detail_detail = $1;
    $detail_detail =~ s/\t+|\s{2,}//g;
    $detail_detail =~ s/<div style="float: right;"><\/div>//;
    my ($address, $city_state_zip) = split /\<br\>/, $detail_detail;
    chop $address;
    $data{address} = $address;
    $city_state_zip =~ /(.*), TN (.*)/;
    $data{city} = $1;
    $data{zip}  = $2;
    warn Dumper(\%data);

    my @items = (
        'Year Built',
        'Square Feet',
        'Total Full Baths',
        'Total Half Baths',
        'Bedrooms',
        'Subdivision',
        'Acres',
        'Listing Price'
    );

    my $table = HTML::TableExtract->new();
    (my $content = $agent->content) =~ s/\&nbsp;?//g;
    $table->parse($content);
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

}
