use warnings;
use strict;
use 5.010;
use Runner;

my %tests=("Ding dong, it is 23:00:00" => "23:00:00",
	   "Captain's log, 2016-07-11, 12:13:51. Land has been sighted!" => "12:13:51",
           "Let us split it in the proportions 33:34:33." => "",
           "11.6:2.5:10.0" => "",
           "Meet you there at 11:11:11 p.m." => "11:11:11 p.m.",
	   "The instruments picked up a collision at 19:52:10.0572" => "19:52:10.0572",
	   "What comes after 11:59 PM?" => "11:59 PM",
	   "They open at 07:00 A.M." => "07:00 A.M.",
	   "Scale 20:60" => ""
    );
	   

my $instructions = <<"END";
============================== Exercise 04: Time ==============================
There are many ways to write time, some more correct than others.
Write a regex that matches time, assuming it is written out either in 24-hour
form or 12-hour form. Hours and minutes must be typed out and separated by
colons :. Seconds MAY be typed out. The seconds can have an arbitrary number
of decimals.

In the 12-hour form, the proper way to write time is HH:MM[:SS] [a.m.|p.m.]
but in practice different forms of a.m./p.m. are used. In this exercise,
match with both upper and lower case letters either with periods or without.

For this exercise, we will assume that no-one is trying to write time where
the hour part is >12 but a.m./p.m. are added anyway.
Even when all tests are passing you might be able to get false positives,
such as 25:00:00, but that\'s OK for this exercise.
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
