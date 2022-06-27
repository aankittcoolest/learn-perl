package Validator::Validator;

use Data::Dumper;
use Jcode;
use Email::Valid::Loose;

sub new {
    my $class = shift;

    my $self = {
        "property" => "",
        "value"    => "",
        "errors"   => {}
    };

    bless( $self, $class );

    return $self;
}

sub set_property {
    my ( $self, $property, $value ) = @_;
    $self->{"property"} = $property;
    $self->{"value"}    = $value;
    return $self;
}

sub validate_required {
    my $self = shift;

    if ( !defined( $self->{"value"} ) ) {
        push @{ $self->{"errors"}->{ $self->{"property"} } },
          $self->{"property"} . " is required.";
    }
    return $self;
}

sub validate_is_integer {
    my $self = shift;
    if ( defined( $self->{"value"} ) && $self->{"value"} !~ /^\d+/ ) {
        push @{ $self->{"errors"}->{ $self->{"property"} } },
          $self->{"property"} . " should be integer.";
    }
    return $self;
}

sub validate_length {
    my ( $self, $length ) = @_;
    if ( length( $self->{"value"} ) > $length ) {
        push @{ $self->{"errors"}->{ $self->{"property"} } },
          $self->{"property"} . " should be less than $length characters.";
    }
    return $self;
}

sub validate_is_katakana {
    my $self = shift;
    if ( Jcode->new( $self->{"value"} )->tr( '　ーァ-ヶ ', '', 'd' ) ne '' ) {
        push @{ $self->{"errors"}->{ $self->{"property"} } },
          $self->{"property"} . " has invalid Katakana.";
    }
    return $self;
}

sub validate_telephone {
    my $self = shift;
    my $tel  = $self->{"value"};
    if ( $tel =~ /[^0-9-]/
        or ( length $tel != 11 && length $tel != 12 && length $tel != 13 ) )
    {
        push @{ $self->{"errors"}->{ $self->{"property"} } },
          "Telephone is invalid.";
    }
    return $self;
}

sub validate_email {
    my $self = shift;
    if (
        !Email::Valid::Loose->address(
            -address => $self->{"value"},
            -mxcheck => 1
        )
      )
    {
        push @{ $self->{"errors"}->{ $self->{"property"} } },
          "email is invalid";
    }
    return $self;
}

sub get_errors {
    my $self = shift;
    return $self->{"errors"};
}

1;
