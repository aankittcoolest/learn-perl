package Data::Person;

sub new {
    my $class = shift;

    # reference to hash
    my $self = {
        "name" => shift,
        "age"  => shift
    };

    bless( $self, $class );

    return $self;
}

sub greet {
    my ( $self, $other ) = @_;
    print "Hello $other; my name is "
      . $self->{"name"}
      . "; I am "
      . $self->{"age"}
      . " years old. \n";
}

1;
