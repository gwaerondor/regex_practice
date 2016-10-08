#!/bin/bash

print_instructions() {
    less <<EOF
================================= sed exercise ================================
INTRODUCTION:
-------------------------------------------------------------------------------
sed is a tool that edits a stream of text. It has a lot of neat functionality,
but today we will be looking at the substitute function.

sed makes a single pass over a stream of text and changes it according to a set
of rules defined on by the user.
The substitute function works as a search-and-replace.

An example of the substitute function in use:
   sed s/your regex here/what it should be replaced with/g

The g at the end means "global", so that all occurences will be replaced and
not just the first one encountered in the stream.

You can pipe the result to sed to do another pass if you want:
  sed 's/blue/red/g' | sed 's/right/left/g'

You can also use backreferences to capture groups:
  echo "The Godfather" | sed 's/^The \(.*\)$/\1, the/g'
If there are more than one capture group, backreference with \2, \3 and so on.

You can also refer back to the entire match with the ampersand:
  seq 99 -1 1 | sed 's/^[0-9]\+$/& bottles of beer on the wall'

Note in the above examples that certain regex characters have been escaped in
the regular expression, for example ( ) and +. For more information about
regular expressions in sed please refer to the man page (man sed)
and to the online documentation, available at:
https://www.gnu.org/software/sed/manual/html_node/Regular-Expressions.html

PROBLEM
-------------------------------------------------------------------------------
You have a .csv (comma-separated values) file, games.csv,
that contains data roughly in the format:
   a,b,c,d
   e,f,g,h
   i,j,k,l

That is, as the name implies, values separated by commas (and also line breaks).
Some engineer thought it would be a good idea to save the values in the
way described above, but a new requirement has come in:
"A value must be able to contain a comma without being separated".

To solve this, all values will from now on be encapsulated in double quotes,
like this:
   "a","b","c","d"
   "e","f","g","h"
   "i","j","k","l"

This allows for a single cell to have values such as:
   "Best, value, EVER!"

Of course, this means that old cells that already contained double quotes must
have them replaced by something else. In this exercise, we will escape them with
a backslash, so every cell that already contains a double quote should escape
the double quotes, that is, replacing " with \"

Output the result to a file called new_games.csv with the > operator,
   sed s/subject/replacement/g < games.csv > new_games.csv

When you think you are done, run this script again with the -c flag:
   ./sed_exercise.bash -c
EOF
}

SOLUTION='"name","year","players","time","coop"
"Monopoly","1935","2-8","60-240","no"
"Mahjong","unknown","4","5-infinite","no"
"Takenoko","2011","2-4","45","no"
"Robo Rally","1994","2-8","20-120","no"
"The Resistance","2010","5-10","15","yes"
"Coup","2012","2-6","10","no"
"Battlestar Galactica: \"Pegasus\"","2009","3-7","240","yes"'

check_solution() {
    RES=$(cat ./new_games.csv)
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
