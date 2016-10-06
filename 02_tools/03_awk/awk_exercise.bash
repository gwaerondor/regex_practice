#!/bin/bash

print_instructions() {
    less <<EOF
================================= awk exercise ================================
AWK is a programming language designed for processing and extracting text data.
We will be using some of the most basic functionality here, to extract data
from a document.

The data we will be working with is a "webpage". In this exercise, the webpage
is simulated by the file testresults.html which is in the same directory as
this exercise. It contains a table with the results of a test run.
HTML files are written in clear text, so in theory we COULD use grep, but we
don't want all of those nasty <tags>. Therefore we will use w3m to fetch
the data. You can try executing the following command:
   w3m -cols 10000 -dump ./testresults.html
The table data should be dumped to your terminal as a text stream.
For more information about w3m, check the man page: man w3m

Now that we have the data, it is time to put it to use. AWK programs can be
executed directly from the shell with the flag -e,
   awk -e

--- UNFINISHED ---
EOF
}

SOLUTION=''

check_solution() {
    RES=$(cat ./failed_tests.txt)
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
