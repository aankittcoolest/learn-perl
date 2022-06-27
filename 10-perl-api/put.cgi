#!/usr/bin/env perl

use strict;
use warnings;
use CGI;
use LWP::UserAgent;
use Mozilla::CA;
use Data::Dumper;
use JSON;

my $cgi = new CGI();

sub post_data {

    # print $cgi->header();
    print $cgi->header('application/json');
    if ( $cgi->request_method eq "PUT" ) {

        my $data = $cgi->param('PUTDATA');
        my $pqr  = decode_json($data);

        my $response = {};

        $response->{"data"} = {
            "firstname" => "Ankit updated",
            "lastname"  => "Agrawal updated"
        };

        my $xyz = {
            "status"  => 201,
            "message" => "Data inserted successfully!",
        };

        $response->{"message"} = $xyz;
        print encode_json($response);

        return;
    }

    my %abc = ( "message" => "Invalid call. Only PUT supported." );
    print encode_json( \%abc );
}

post_data();
