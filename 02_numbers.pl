use warnings;
use strict;
use 5.010;
use Runner;

my %tests=("I have 5 apples, and you have 3. The difference is 2." => "5, 3, 2",
	   "The number 10000 is called a myriad!" => "10000",
           "e is approximately 2.71828" => "2.71828",
           "42+58=100" => "42, 58, 100",
           "7.7+5.3 = 11+1+1" => "7.7, 5.3, 11, 1, 1",
           "PR0 L33T H4XX0R" => "0, 33, 4, 0",
           "127.0.0.1" => "127.0, 0.1",
	   "(100)(200)(300)" => "100, 200, 300"
          );

my $instructions = <<"END";
========================= Exercise 02: Finding numbers =========================
I want you to find all numbers in a text. A "number" is is anything that
fulfills these conditions:

1) Groups of digits and a maximum of one decimal dot (.)
2) Contains digits on both sides of any possible decimal dot.
3) Is terminated when something non-numerical is encountered,
   except for a decimal dot. Remember that a second dot is no longer
   a decimal dot, and can be a delimiter for a new number.

Hint: Check out what + and ? mean in regular expressions!
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
