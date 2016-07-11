use warnings;
use strict;
use 5.010;
use Runner;

my %tests=("Ah!" => "A",
	   "Aaaargh!" => "A, a, a, a");

my $instructions = <<"END";
===================== Exercise 01: Simple letter matching =====================
In this exercise, match with every single instance of the letter "a".
This includes both upper and lower case, "A" and "a".
Only match with one letter at a time, not a sequence or group of them.

Hint: Character classes are defined within square brackets, [], and are
      different from groups, which are within parentheses, ().
     
See also: The wikipedia article for regular expressions is quite informative,
          you can find it on https://en.wikipedia.org/wiki/Regular_expression
          Make sure to use the perl style regexes though, not POSIX or vim.
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
