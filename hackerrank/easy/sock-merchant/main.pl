#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

#
# Complete the 'sockMerchant' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER n
#  2. INTEGER_ARRAY ar
#

sub sockMerchant {

    my ( $total_socks, $socks_ref ) = @_;
    my %hash;
    $hash{$_}++ for @$socks_ref;

    my $total = 0;
    foreach ( keys %hash ) {
        $total += int( $hash{$_} / 2 );
    }
    return $total;

}

# open(my $fptr, '>', $ENV{'OUTPUT_PATH'});

# my $n = ltrim(rtrim(my $n_temp = <STDIN>));

# my $ar = rtrim(my $ar_temp = <STDIN>);

# my @ar = split /\s+/, $ar;

my $n  = 9;
my @ar = ( 10, 20, 20, 10, 10, 30, 50, 10, 20 );

my $result = sockMerchant $n, \@ar;

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
