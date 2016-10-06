# Regex practice

This repository consists mostly of scripts that contain exercises
for learning or practicing regular expressions.

The exercises are split up into two different sections:
- Syntax exercises
- Tool exercises

## Syntax exercises
These exercises focus on _how_ to write regular expressions.
I have tried making the syntax exercises as straightforward as possible.

To read the instructions for an exercise,
run the perl script without any input arguments.
Example:

> ./01_simple_letter.pl

Instructions will be printed out in the terminal.
The tests that will be run in order to decide if the exercise has been successfully
completed is also printed to the terminal.

To submit an answer for an exercise, run the script with a regular expression
as the input argument. Surround it with single quotes so that it does not get
misinterpreted by your shell. The regex will be run with each of the test cases.
Example:

> ./01_simple_letter.pl '[Aa]'

The global option, g, will be added for all regexes automatically, meaning the script
will find as many matches as possible. Your regex will be surrounded by delimiters
automatically as well. This means that for the input above, '[Aa]', the following regex will be run:
> /[Aa]/g

For any failed test cases, the expected matches will be printed out together
with the actual matches. Modifications to the regex can be done before submitting again.

The exercises can be done in any order, though the idea is that the difficulty will
be progressively increasing in later exercises.

## Tool exercises
The nature of these exercises are a bit different from the syntax exercises, in that they try to show how, why, where and when regular expressions are used.

Each exercise has its own directory. cd into the directory before starting the exercise, as you will need to use and create files inside the directory.

To read the instructions for an exercise, run the script without any input arguments.
They will open in _less_, you can quit with the q key.
Example:

> ./grep_exercise.bash

When you think you have finished the exercise according to the instructions, run the script with the flag -c to check your solution:

> ./grep_exercise.bash -c

A printout will show if you have succeeded or if you have not yet succeeded. If you have not succeeded, the expected result and actual result will also be printed.

Enjoy!