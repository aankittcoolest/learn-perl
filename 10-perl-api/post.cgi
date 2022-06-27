#!/usr/bin/env perl

use strict;
use warnings;
use CGI;
use LWP::UserAgent;
use Mozilla::CA;
use Data::Dumper;
use JSON;
use File::Log;

my $cgi = new CGI();

# sub post_data {

#     # print $cgi->header();
#     print $cgi->header('text/html');
#     if ( $cgi->request_method eq "POST" ) {

#         my $data = $cgi->param('POSTDATA');
#         my $xyz  = {
#             "status"  => 201,
#             "message" => "Data inserted successfully!",
#         };
#         print encode_json($xyz);

#         # print $data;
#         return;
#     }

#     my %abc = ( "message" => "Invalid call. Only POST supported." );
#     print encode_json( \%abc );
# }

sub post_data_form {

    print $cgi->header('application/json');
    my $data = $cgi->param('hello');
    my $log  = File::Log->new( debug => 4, logFileName => 'abc.log' );
    $log->msg( 2, Dumper($data) );

    my $xyz = {
        "status"  => 201,
        "message" => "Data inserted successfully!",
    };

    # print encode_json($xyz);

    print encode_json($xyz);

}

post_data_form();
