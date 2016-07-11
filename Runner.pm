package Runner;

use warnings;
use strict;
use 5.010;

sub print_instructions {
    my $instructions = shift(@_);
    my %tests = @_;
    my @test_keys = keys(%tests);
    my $test_strings = join("\n  ", @test_keys);
    say("$instructions");
    print("The following texts will be tested:\n  ");
    say($test_strings);
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
    my $expected = $_[2];
    print("Running test \"${test}\"... "); 
    my $matches = get_all_matches($regex, $test);
    if($matches eq $expected) {
	say("passed.");
	return 1;
    } else {
	say("FAILED!");
	say("    Expected: $expected");
	say("    Got:      $matches");
	return 0;
    }
}

sub run_all_tests {
    my $regex = shift(@_);
    my %tests = @_;
    for my $t (keys %tests) {
	if(!run_test($regex, $t, $tests{$t})) {
	    exit(1);
	} 
    }
    say("Good job! You pass.");
}

1;
