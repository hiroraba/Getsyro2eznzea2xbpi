#!/usr/bin/perl

use strict;
use warnings;

use LWP::UserAgent;
use HTML::TreeBuilder;

my $ua = LWP::UserAgent->new();
$ua->proxy([qw/ http /] => 'socks://localhost:9050');
$ua->cookie_jar({});
my $res = $ua->get('http://syro2eznzea2xbpi.onion');
my $content = $res->content;

my $tree = HTML::TreeBuilder->new;
$tree->parse($content);
my @items = $tree->find('ol')->find('li');

print $_->as_text . "\n" for @items;
