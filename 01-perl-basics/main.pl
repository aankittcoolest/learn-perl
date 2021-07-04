use strict;
use warnings;

$| = 1;

sub main {
    my $file = "data.txt";
    open( INPUT, $file ) or die("Input file $file not found. \n");

    while ( my $line = <INPUT> ) {

        # non greedy
        if ( $line =~ /(s.*?n)/ ) {
            print "$1\n";
        }

        #  greedy
        if ( $line =~ /(s.*n)/ ) {
            print "$1\n";
        }
    }
    close(INPUT);

}

sub sub_sequence {

    # \d digit
    # \s space
    # \S non-space
    # \w alphanumeric including _

    my $text = 'I am 117 year old tomorrow.';

    if ( $text =~ /(\d+)/ ) {
        print "Matched: '$1'\n";
    }

    if ( $text =~ /(y\S*)/ ) {
        print "Matched: '$1'\n";
    }
}

sub numeric_quantifiers {

    # * zero or more of the precedeing character, as may as possible
    # + one or more of the preceding, as many as possible
    # +? zero or more of the preceding character, as few as possible
    # +? one or more of the preceding, as few as possible
    # {5} five of the preceding
    # {3,6} at least three and at most 6
    # {3,} at least three

    my $text = 'DE75883';

    if ( $text =~ /(DE\d{3,6})/ ) {
        print "Matched: '$1'\n";

    }
}

sub emails_filter {
    my @emails = (
        'john@caveofprogramming.com', 'hello',
        '@llkj.com',                  'jklj778@somewhere77.com',
        'lkj@7788'
    );
    for my $email (@emails) {
        if ( $email =~ /.*@.+\.com/ ) {
            print "Valid: $email\n";
        }
        else {
            print "Invalid: $email\n";
        }
    }
}

# main()
# sub_sequence()
# numeric_quantifiers()
emails_filter()
