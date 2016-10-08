#!/bin/bash

print_instructions() {
    less <<EOF
================================= AWK exercise ================================
INTRODUCTION
-------------------------------------------------------------------------------
AWK is a programming language designed for processing and extracting text data.
We will be using some of the most basic functionality here, to extract data
from a document.

The data we will be working with is a "webpage". In this exercise, the webpage
is simulated by the file testresults.html which is in the same directory as
the exercise. It contains a table with the results of a test run.
HTML files are written in clear text, so in theory we COULD use grep, but we
don't want all of those nasty <tags>. Therefore we will use w3m to fetch
the data. w3m is a browser that works in terminals. It is also able to dump
a website so that we can get all the data and make it easy to pass on to
another program. That is exactly what we will be doing.

You can try executing the following command:
   w3m -cols 999 -dump ./testresults.html
The table data should be dumped to your terminal as a text stream.
For more information about w3m, check the man page: man w3m

Now that we have the data, it is time to put it to use. AWK programs can be
executed directly from the shell with the flag -e,
   awk -e 'script goes here'
AWK will split the input data into fields, which can then be accessed through
the script itself. The default field delimiter is space, which is what we will
be using in this exercise as well, but it can be set to anything you like.

The AWK script will read through the input data line by line, and for each line
a set of specified actions will be performed. We will only need to know about
two things for this exercise, but AWK has a lot of powerful tools that you can
read about in the manual: man awk

Let's start with a very simple example:
   cat "A1 B2 C3 D4" | awk -e '{print $3 " " $1}'
This simple line will print out 'C3 A1' to the terminal. As you can see, we can
access field number N using $N, and the command print will print it to the
screen. We can add a condition to this:
   awk -e 'match($1, /regex/) { BODY }'

PROBLEM
-------------------------------------------------------------------------------
Now for the task:
We want to know the suites and the testnames of all failing and skipped test
cases. We do not care about the other columns or rows; we don't want to know
the comments or the test descriptions for the failing or skipped tests,
and we don't care about the passing tests at all.
Separate suite name and testcase name with a space.
Put the result in a file called bad_tests.txt

The task this time is relatively simple; the solution is more or less exactly
as in the examples above. But the exercise shows an example of how regular
expressions can be used with tools to do powerful stuff with simple
commands.

When you think you are done, run this script again with the -c flag:
   ./sed_exercise.bash -c
EOF
}

SOLUTION='Maths operator_priorities_with_groups
Calendar today_should_be_saturday
Language things_should_be_translated
Physics pigs_should_fly
Politics verify_no_wars_or_conflicts'

check_solution() {
    RES=$(cat ./bad_tests.txt)
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
