#!/usr/bin/perl

use strict;
use warnings;

#
# Complete the 'sumXor' function below.
#
# The function is expected to return a LONG_INTEGER.
# The function accepts LONG_INTEGER n as parameter.
#

sub sumXor {
    my $n = shift;

    my $count = 0;
    my $end   = int( $n / 2 );

    $count = ( ( $_ ^ $n ) == ( $n + $_ ) ) ? $count = $count + 1 : $count
      for ( 0 .. $end );
    return $count;

}

# open(my $fptr, '>', $ENV{'OUTPUT_PATH'});

# my $n = ltrim(rtrim(my $n_temp = <STDIN>));
my $n = 10;

my $result = sumXor $n;

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
