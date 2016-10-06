use warnings;
use strict;
use 5.010;
use Runner;

my %tests=("test" => "expected",
	   "test2" => "expected2");

my $instructions = <<"END";
The instructions.
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
