#!/bin/bash

print_instructions() {
    less <<EOF
================================= grep exercise ================================
INTRODUCTION
--------------------------------------------------------------------------------
grep is a tool that can be used to find certain text in one or many files,
and return only the matching lines.

With the flag -P, grep will accept perl-style regular expressions.
For example, if you want to find all words starting with the letter A from a
dictionary the following command can be used:
   grep -P "^A" dictionary.txt

PROBLEM
--------------------------------------------------------------------------------
In the directory of this exercise, there is a file called stringlib_tests.erl
which contains some pseudo-test cases for text operations.
The Managers have asked you to produce a list of every test case header you
have for stringlib operations.

Use grep on the contents of the file string_tests.erl to extract all of the
lines containing test case headers. Save the results to a new file called
headers.txt. You can do this by directing the output with the > operator:

  grep -P "your regex here" stringlib_tests.erl > headers.txt

The programmer has been naughty and not been using a consistent style throughout
the file.

The test case header is defined in any of the following ways, including the
final comma:

  TC = "This is the first style of test case header",
  Tc = "This is the second style of test case header",
  Testcase = "This is the third style",
  testcase = "This is the fourth style",

In other words, some variable or field name, then an equal sign followed by
some text in double quotes, and finished off with a comma. There can be any
amount of indentation before the assignment:
  TC = "This is a tiny bit indented.",
             TC = "This is more indented!",

To make matters worse, sometimes spaces are not used before or after the =,
and sometimes several spaces are used!
  Testcase="no spaces.",
  Testcase      = "Tons of spaces.",

Extract the header lines in their entirity, including all white spaces.

When you think you are done, run this script again with the flag -c
  ./grep_exercise.bash -c
EOF
}

SOLUTION='    Testcase = "Check that string can be reversed",
	      testcase   = "Check that strings can be converted to upper case",
    TC="Check that strings can be converted to lower case",
    Tc             = "Check that strings can be camel cased",'


check_solution() {
    RES=$(cat ./headers.txt)
    if [ "${SOLUTION}" = "${RES}" ]; then
	echo "You are done! Good job!"
    else
	RED="\e[31m"
	GREEN="\e[32m"
	NC="\033[39m"
	echo -e "You are not done yet."
	echo -e "${GREEN}Expected${NC}:"
	echo -e "${SOLUTION}"
	echo -e ""
	echo -e "${RED}Got${NC}:"
	echo -e "${RES}"
    fi
}

if [ "${1}" = "-c" ]; then
    check_solution
else
    print_instructions
fi
exit 0
