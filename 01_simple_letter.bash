#!/bin/bash

TESTS=("Ah!" "Aaaargh!")
EXPECTED=("A" "A a a a")

print_tests() {
    for i in ${!TESTS[*]}; do
	echo "     \"${TESTS[i]}\""
    done
}

print_instructions() {
    cat<<EOF
===================== Exercise 01: Simple letter matching =====================
In this exercise, match with every single instance of the letter "a".
This includes both upper and lower case, "A" and "a".
Only match with one letter at a time, not a sequence or group of them.
     
Hint: Character classes are defined within square brackets, [], and are
      different from groups, which are within parentheses, ().

See also: The wikipedia article for regular expressions is quite informative,
          you can find it on https://en.wikipedia.org/wiki/Regular_expression
          Make sure to use the perl style regexes though, not POSIX or vim.
EOF

    CMD="bash ${0} '/[Rr]egexp?/'"
    echo "=== These tests will be run ==="
    print_tests
    echo "To submit your answer, run this script with the regex in quotes. Example:"
    echo "     ${CMD}"
}

print_instructions_and_exit_if_needed() {
    if [ $# -ne 1 ]; then
	print_instructions
	exit 0
    fi
}

print_error() {
    echo "FAILED! I was trying your regex with this:"
    echo "      \"${3}\""
    echo "  The matches I expected were:"
    echo "      ${1}"
    echo "  But instead I got this:"
    echo "      ${2}"
    exit 1
}

print_success() {
    echo "Passed: \"${1}\""
}

grade() {
    if [ "${1}" != "${2}" ]; then
	print_error "${1}" "${2}" "${3}"
    else
	print_success "${3}"
    fi
}

run_all_tests_and_exit() {
    REGEX="${1}g"
    for i in ${!TESTS[*]}; do
	TEST=${TESTS[i]}
	PERL_SCRIPT="my @res = (\"${TESTS[i]}\" =~ ${REGEX}); print(\"@res\");"
	RESULT=$(perl -e "${PERL_SCRIPT}")
	grade "${EXPECTED[i]}" "${RESULT}" "${TEST}"
    done
    echo "Good job! Exercise finished successfully. Move on to the next one."
    exit 0
}

main() {
    print_instructions_and_exit_if_needed $@
    run_all_tests_and_exit $@
}

main $@
