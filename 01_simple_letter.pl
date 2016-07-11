use warnings;
use strict;
use 5.010;

my %tests=("Ah!" => "A",
	   "Aaaargh!" => "A, a, a, a");

sub print_instructions {
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
    say("$instructions");
}

sub get_all_matches {
    my $regex = $_[0];
    my $target = $_[1];
    my @results = ($target =~ /$regex/g);
    return join(", ", @results);
}

sub run_test {
    my $regex = $_[0];
    my $test = $_[1];
    my $expected = $tests{$test};
    print("Running test \"${test}\"... "); 
    my $matches = get_all_matches($regex, $test);
    if($matches eq $expected) {
	say("passed.");
    } else {
	say("FAILED!");
	say("    Expected: $expected");
	say("    Got:      $matches");
    }
}

sub run_all_tests {
    my $regex = $_[0];
    for my $t (keys %tests) {
	run_test($regex, $t);
    }
}

sub main {
    if($#ARGV < 0) {
	print_instructions();
    } else {
	my $regex = $ARGV[0];
	run_all_tests($regex);
    }
}

main();
