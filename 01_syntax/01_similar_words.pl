use warnings;
use strict;
use 5.010;
use Runner;

my %tests=("color" => "color",
	   "colour" => "colour");

my $instructions = <<"END";
Write a regular expression that matches British English and American English
spellings of the word color/colour.
END

sub main {
    if($#ARGV < 0) {
	Runner::print_title($0);
	Runner::print_instructions($instructions, %tests);
    } else {
	my $regex = $ARGV[0];
	Runner::run_all_tests($regex, %tests);
    }
}

main();
