package Communication::Speak;
use Exporter qw(import);

@EXPORT_OK = qw(test);

# bad practice
# @EXPORT    = qw(test);

sub test {
    print "Hello there.\n";
}

1;
