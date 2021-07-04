use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

=pod
    This is a ACME XML parser version 1.0
    Use with care.
=cut

# sample execution: perl main.pl -f abc.xml -a -c
sub main() {
    my %opts;

    getopts( 'af:r', \%opts );
    if ( !checkusage( "Hello", 7 ) ) {
        usage();
    }

    if ( !hash_argument( \%opts ) ) {
        usage();
    }

    # print Dumper(%opts);

    # my $file = $opts{'f'};

}

sub checkusage {

    # my ( $greeting, $number ) = @_;
    # print "$greeting number $number\n";

    # print Dumper(@_);

    my $greeting = shift;
    my $number   = shift;
    print "$greeting number $number\n";
    return 1;
}

sub hash_argument {
    $opts = shift;

    my $a = $opts->{"a"};
    my $r = $opts->{"r"};
    my $f = $opts->{"f"};

    # imagine a is optional and r,f is mandatory

    unless ( defined($r) and defined($f) ) {
        return 0;
    }

    unless ( $f =~ /\.xml$/ ) {
        print "File must have the extension .xml\n";
    }

}

sub usage {
    print <<USAGE;

    usage: perl main.pl <options>
           -f <file name>: specify XML filename to parse
           -a              turn off error checking
           -r              Run the program

    example usage:
        perl main.pl -f test.xml -a
USAGE

    exit();
}

main()
