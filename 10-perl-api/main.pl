use strict;
use warnings;
use Validator::Validator;
use JSON;

sub main {
    my $validator = new Validator::Validator();
    $validator->set_property("mid")->validate_required->validate_is_integer;
    $validator->set_property( "name", "あん" )->validate_length(10)
      ->validate_is_katakana;
    $validator->set_property( "email", 'aankittcoolest@gmail.com' )
      ->validate_email;
    $validator->set_property( "telephone", "12345678910" )->validate_telephone;

    my $errors = $validator->get_errors();
    my @abc    = $errors->{"mid"};

    print( defined( $errors->{"mid"} ) );

    # print %$errors ? 1 : 0;
    # if (%$errors) {
    #     print "errors are present!";
    # }
    print encode_json $errors;
}

main();
