#!/usr/bin/perl

use strict;
use warnings;

#
# Complete the 'strangeCounter' function below.
#
# The function is expected to return a LONG_INTEGER.
# The function accepts LONG_INTEGER t as parameter.
#

sub strangeCounter {
    my $t = shift;

    my $l = 3;
    while ( $t > $l ) {
        $t = $t - $l;
        $l *= 2;
    }

    return $l - $t + 1;

}

# open(my $fptr, '>', $ENV{'OUTPUT_PATH'});

# my $t = ltrim(rtrim(my $t_temp = <STDIN>));

my $t = 1000000000000;

# my $t = 21;

my $result = strangeCounter $t;

# print $result;

# print $fptr "$result\n";

# close $fptr;

# sub ltrim {
#     my $str = shift;

#     $str =~ s/^\s+//;

#     return $str;
# }

# sub rtrim {
#     my $str = shift;

#     $str =~ s/\s+$//;

#     return $str;
# }
