#!/usr/bin/perl
use strict;
use WWW::Mechanize;
use URI::URL;
use HTML::TableExtract;
use List::MoreUtils qw/any/;

my %data;
my $agent = WWW::Mechanize->new( autocheck => 1 );
$agent->env_proxy();

$agent->get('http://www.mlsfinder.com/tn_mtrmls/kw_493/index.cfm?action=listing_detail&property_id=1032268');
my @items = ( 'Year Built','Square Feet','Total Full Baths','Total Half Baths', 'Bedrooms' );
my $table = HTML::TableExtract->new();
(my $content = $agent->content) =~ s/\&nbsp;?//g;
$table->parse($content);
for my $ts ($table->table_states) {
    for my $row ($ts->rows) {
        if (any { defined($_) ? $row->[0] =~ $_ : undef } @items) {
            #print join(", ", @$row), "\n";
            $data
        }
    }
}

