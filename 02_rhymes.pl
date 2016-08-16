use warnings;
use strict;
use 5.010;
use Runner;

my %tests=("fat" => "fat",
	   "cat" => "cat",
	   "hat" => "hat",
           "mat" => "mat",
	   "flat" => "flat");

my $instructions = <<"END";
============================= Exercise 02: Rhymes =============================
Write a regular expression that matches some rhyming words ending with -at.
END

sub main {
    if($#ARGV < 0) {
	Runner::print_instructions($instructions, %tests);
    } else {
	my $regex = $ARGV[0];
	Runner::run_all_tests($regex, %tests);
    }
}

main();
