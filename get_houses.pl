#!/usr/bin/perl

use warnings;
use strict;
#Written by Kevin at Tue Jan 13 22:49:25 2009
#

use WWW::Mechanize;
use Data::Dumper;
use HTML::TokeParser;

my $m = WWW::Mechanize->new;

$m->get("http://www.mlsfinder.com/tn_mtrmls/kw_493/index.cfm?action=userlogin");
$m->submit_form(
        form_number => 1,
        fields      => {
            email_address => 'kevinold@gmail.com',
            password    => 'eYWCFgt1',
        }
    );
$m->follow_link( n => 2 );

#$m->get("http://www.mlsfinder.com/tn_mtrmls/kw_493/index.cfm?action=showfavorites");
     
my @top_links = @{$m->links};

for my $top_link_num (0..$#top_links) {
    next unless $top_links[$top_link_num][0] =~ /listing_detail/; 
    $m->follow_link( n=>$top_link_num ) or die "can't follow $top_link_num";
    print $m->uri, "\n";

    my $stream = HTML::TokeParser->new($m->content());
    my $tag = $stream->get_tag("div");
    if ($tag->[1]{class} eq "page_header") {
      print $stream->get_trimmed_text("/div");
    }

    $m->back or die "can't go back";
}

