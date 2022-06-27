#!/usr/bin/perl

use strict;
use warnings;

#
# Complete the 'appendAndDelete' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. STRING s
#  2. STRING t
#  3. INTEGER k
#

sub appendAndDelete {
    my ( $s, $t, $k ) = @_;

    my @a = split //, $s;
    my @b = split //, $t;

    my $c = '';
    foreach (@a) {
        my $tmp = $c . $_;
        if ( $t =~ m/^$tmp/ ) {
            $c .= $_;
        }
        else {
            last;
        }
    }

    my $unmatched_len_t = 0;

    if ( $t =~ m/$c/ ) {
        $unmatched_len_t = length $';
    }

    my @c               = split //, $c;
    my $matched_len     = @c;
    my $total_len_s     = @a;
    my $unmatched_len_s = @a - @c;

    if ( @a + @b <= $k ) {
        return "Yes";

    }

    if ( $unmatched_len_t + $unmatched_len_s <= $k ) {
        if ( ( $unmatched_len_t + $unmatched_len_s ) % 2 == $k % 2 ) {
            return "Yes";
        }
    }
    return "No";

}

# open(my $fptr, '>', $ENV{'OUTPUT_PATH'});

# my $s = <STDIN>;
# chomp($s);

# my $t = <STDIN>;
# chomp($t);

# my $k = ltrim(rtrim(my $k_temp = <STDIN>));

# my $s = "hackerhappy";
# my $t = "hackerrank";
# my $k = 9;

# my $s = "aba";
# my $t = "aba";
# my $k = 7;

# my $s = "ashley";
# my $t = "ash";
# my $k = 2;

my $s = "qtart";
my $t = "qart";
my $k = 7;

my $result = appendAndDelete $s, $t, $k;
print $result;

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
