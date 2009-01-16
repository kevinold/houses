#!/usr/bin/perl
use strict;
use WWW::Mechanize;
use URI::URL;
use HTML::TableExtract;
use List::MoreUtils qw/any/;
use Data::Dumper;
use Getopt::Long;
use YAML qw(LoadFile Dump);
use HousesDB;

my $update_statuses = 0;
my $load_new        = 0;

GetOptions(
    'us'       => \$update_statuses,
    'load_new' => \$load_new,
);

# TODO:

my $schema = HousesDB->connect('dbi:SQLite:houses.db');
my $yaml   = LoadFile('houses.yml');

load_new()        if $load_new;
update_statuses() if $update_statuses;

sub update_statuses {

    foreach my $key (keys %{$yaml}) {
        my $ids = $yaml->{$key};
        foreach my $id (@$ids) {
            $schema->resultset('Houses')->find({mls => $id})->update({our_status => lc $key});
        }
    }

}

sub load_new {

    foreach my $key (keys %{$yaml}) {
        my $ids = $yaml->{$key};
        foreach my $id (@$ids) {
            next unless $id;
            my $mls = $schema->resultset('Houses')->find({mls => $id});

            #warn "id is: ", $id, Dumper($mls);
            get_kw($id) unless $mls;
        }
    }

}

sub get_kw {
    my $mls = shift;

    my %data = (mls => $mls);
    my $agent = WWW::Mechanize->new(autocheck => 1);
    $agent->env_proxy();
    $agent->get('http://www.mlsfinder.com/tn_mtrmls/kw_493/index.cfm?action=listing_detail&property_id=' . $mls);

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

    #warn Dumper(\%data);

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

                #print join(", ", @$row), "\n";
                my $key = lc $row->[0];
                $key =~ s/[^A-Za-z ]//;
                $key =~ s/ /_/g;

                #print $key, "\n";
                $data{$key} = $row->[1];
            }
        }
    }

    $schema->resultset('Houses')->create(\%data);

}
