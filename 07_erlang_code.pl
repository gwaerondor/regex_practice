use warnings;
use strict;
use 5.010;
use Runner;

my %tests=("Song = [{X, bottles_of_beer} || X <- lists:reverse(lists:seq(1,99))]." =>
	   "[{X, bottles_of_beer} || X <- lists:reverse(lists:seq(1,99))]",

	   "Alphabet = [X || X <- lists:seq(65, 90)]." =>
	   "",

	   "Sums = [add({A, B}) || {A, B} <- {lists:seq(1,5), lists:seq(10, 15)}]." =>
	   "[add({A, B}) || {A, B} <- {lists:seq(1,5), lists:seq(10, 15)}]",

	   "List = [{head, Head}, | Tail]." =>
	   "",

	   "Test_results = lists:map(fun(X) -> X =/= {error, _} end, Values)." =>
	   "lists:map(fun(X) -> X =/= {error, _} end, Values)",

	   "Double_trouble = lists:map(fun(X) -> X * 2 end, [1, 2, 3])." =>
	   "",

	   "Sums = lists:map(fun({A,B}) -> A + 2 end, [{1, 3}, {3, 7}])." =>
	   ""
);

my $instructions = <<"END";
You wrote a piece of code ten years ago that you need to change now.
You only remember vaguely what the snippet looked like. It was probably
a list comprehension, and there was a tuple in the list comprehension body.

Though it might have been a lists:map/2 and not a list comprehension after all.
But there was definitely a tuple in the body of the fun.

Extract all list comprehensions that contain tuples in their body.
Also extract all instances of lists:map/2 where the first argument, the fun,
contains a tuple in its body.

A tuple is anything surrounded by curly braces, { and }.
A simple list comprehension has the following form:
  [ BODY || generator ]

A fun (lambda function) looks like this:
  fun(Arguments) -> BODY end

Note: Keep in mind that square brackets, curly braces and pipes are all
      characters with special meaning in regular expressions, which means
      that they must be escaped if we want to match them.
Note: There can be an arbitrary number of spaces between Erlang terms
      and expressions, so remember to keep white spaces in mind!
END

sub main {
    if($#ARGV < 0) {
	Runner::print_title($0);
	Runner::print_instructions($instructions, %tests);
    } else {
	my $regex = "@ARGV";
	Runner::run_all_tests($regex, %tests);
    }
}

main();
