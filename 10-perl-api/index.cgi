#!/usr/bin/env perl

use strict;
use warnings;
use CGI;
use LWP::UserAgent;
use Mozilla::CA;
use Data::Dumper;
use JSON;

my $cgi = new CGI();

sub get_data {

    print $cgi->header('application/json');
    my $ua = LWP::UserAgent->new( ssl_opts => { verify_hostname => 1 } );
    $ua->agent("Mozilla/8.0");
    my $response = $ua->get("https://reqres.in/api/users?page=2");
    if ( $response->is_success ) {
        my $res = $response->decoded_content;
        print $res;
    }

    # my $data = decode_json($res);

    # foreach my $item(@{$data->{"data"}}) {
    #     print Dumper($item);
    # }
    # }
    # else {
    #     die $response->status_line;
    # }
}

get_data();
