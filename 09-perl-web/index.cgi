#!/usr/bin/env perl

use strict;
use warnings;

use CGI;

my $CGI = new CGI();

sub main {
    print $CGI->header();

    my $user     = $CGI->param("user");
    my $password = $CGI->param("pass");

    print <<HTML;
    <html>
        <b>Hello world</b>
        User: $user, Pass: $password
    </html>
HTML
}

main()
