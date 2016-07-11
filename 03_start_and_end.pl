use warnings;
use strict;
use 5.010;
use Runner;

my %tests=("Chapter 1: It Was A Bright Cold Day In April, And The Clocks Were Striking Thirteen. Winston Smith, His Chin Nuzzled Into His Breast In An Effort To Escape The Vile Wind, Slipped Quickly Through The Glass Doors Of Victory Mansions."
	   => "Chapter 1: It Was A Bright Cold Day In April, And The Clocks Were Striking Thirteen.",
	   
	   "The Death Spectres Are A Loyalist Chapter Of Space Marines Of The 13th Founding, Only The Second Known Chapter Of Astartes, Besides The Exorcists, To Have Been Created In That Unusual Founding." 
	   => "",
	   
           "For More Information, Please Refer To Chapter 4.2."
	   => "",
	   
	   "...and they lived happily ever after. The End."
	   => "...and they lived happily ever after. The End.",

	   "This Is The Beginning Of The End. I Can See It In Your Eyes, In Everything You Do"
	   => ""
);

my $instructions = <<"END";
========================== Exercise 03: Start and end ==========================
I want you to match entire sentences containing the word "Chapter", but only
when "Chapter" is the beginning of the text. Match the word "Chapter" and
everything after it until the first period (.).
There are different ways to do this, and if you are familiar with greedy/lazy
regexes, you are free to solve it that way. However, it can also be solved by
matching a period only once, but other characters several times. This can be
achieved by matching with NOT period followed by period, for example [^\\.]\\.
or matching with other things followed by a period, for example [abc]*\\.

I also want you to match entire lines containing "The End.", but only when it
occurs as the very end of the line. It must include the period.

Hints: - Read about the special regex characters ^ and \$.
       - Remember to escape characters that have special meaning in regex,
         such as the period \\. if you want to match them.
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
