#!/bin/bash

TESTS=(
#    "I have 5 apples, and you have 3. The difference is 2, right?" \
#    "The number 10000 is called a myriad" \
#    "e is approximately 2.71828" \
#    "42+58=100" \
#    "7.7+5.3 = 11+1+1" \
#    "PR0 L33T H4XX0R"
#    "ping 127.0.0.1"
    "(100)(200)(300)"
)
EXPECTED=(
#          "5 3 2" \
#          "10000" \
#          "2.71828" \
#          "42 58 100" \
#          "7.7 5.3 11 1 1" \
#          "0 33 4 0" \
#          "127.0 0.1" \
          "100 200 300"
)

print_tests() {
    for i in ${!TESTS[*]}; do
	echo "     \"${TESTS[i]}\""
    done
}

print_instructions() {
    cat<<EOF
========================= Exercise 02: Finding numbers =========================
I want you to find all numbers in a text. A "number" is is anything that
fulfills these conditions:

1) Groups of digits and a maximum of one decimal dot (.)
2) Contains digits on both sides of any possible decimal dot.
3) Is terminated when something non-numerical is encountered,
   except for a decimal dot. Remember that a second dot is no longer
   a decimal dot, and can be a delimiter for a new number.

Hint: Check out what + and ? mean in regular expressions!
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
    BS="\\\\"
    LP="\\("
    INPUT=$(echo "${1}" | sed s/${BS}/${BS}${BS}/g) # Ugly... but we must escape for the perl script.
    perl -E "my \$s = \"${INPUT}\"; \$s=~ s/(?!${BS})${LP}/\\1${LP}\?:/g; print \"\$s\\n\""
    echo next.
    REGEX=$(echo "${1}g" | sed s/\(/\(\?:/g)  
    for i in ${!TESTS[*]}; do
	TEST=${TESTS[i]}
	PERL_SCRIPT="use 5.010; my @res = (\"${TESTS[i]}\" =~ ${REGEX}); print(\"@res\");"
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
