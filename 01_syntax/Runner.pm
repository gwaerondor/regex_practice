package Runner;

use warnings;
use strict;
use 5.010;
use List::Util "min";

sub print_title {
    my $script_name = $_[0];
    my ($number, $name) = split(/_/, $script_name, 2);
    $name =~ s/\.pl$//;
    $name =~ s/_/ /g;
    $name = ucfirst($name);
    my $title = " Exercise " . $number . ": " . $name . " ";
    my $pad_length = (80 - length($title))/2;
    my $pad = ('=' x $pad_length);
    say($pad . $title . $pad);
}

sub print_instructions {
    my $instructions = shift(@_);
    my %tests = @_;
    my @test_keys = keys(%tests);
    my $test_strings = join("\"\n  - \"", @test_keys) . "\"";
    say("$instructions");
    print("The following texts will be tested:\n  - \"");
    say($test_strings);
}

sub get_all_matches {
    my $regex = $_[0];
    my $target = $_[1];
    my @results = ();
    push(@results, $&) while ($target =~ /$regex/g);
    return join(", ", @results);
}

sub fix_test_length {
    my $s = $_[0];
    my $trunc_length = min(50, length($s));
    my $result = substr($s, 0, $trunc_length);
    while(length($result) < 50) {
	$result = $result . " ";
    }
    return $result;
}

sub run_test {
    my $regex = $_[0];
    my $test = $_[1];
    my $expected = $_[2];
    my $truncated_test = fix_test_length($test);
    print("Running test: ${truncated_test}  ..."); 
    my $matches = get_all_matches($regex, $test);
    if($matches eq $expected) {
	say("\e[32mpassed\e[0m.");
	return 1;
    } else {
	say("\e[31mFAILED\e[0m!");
	say("    Expected: $expected");
	say("    Got:      $matches");
	return 0;
    }
}

sub run_all_tests {
    my $regex = shift(@_);
    my %tests = @_;
    my @results = ();
    for my $t (keys %tests) {
	my $result = run_test($regex, $t, $tests{$t});
	push(@results, $result);
    }
    if(!grep(/0/, @results)){
	say("Good job! You pass.");
    }
}

1;
