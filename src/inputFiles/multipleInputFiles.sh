#!/usr/bin/env bash


# FNR == 1 {...}
# awk treats the contents of all the input files as one big stream therefore NR is not reset for each input file;
# use FNR instead (same rules apply to other variables)

# FILENAME is only accessible in the body (not begin nor end)

function walk() {
    find "${1}" -type f \
    -not -path "*git/*" \
    -not -path "*_testdata/*" \
    -name "*.sh" | xargs awk '
FNR == 1 {
    split(FILENAME, tokens, "/")
    printf "\n\n[%s/%s](src/%s/%s)\n\n", tokens[9], tokens[10], tokens[9], tokens[10]
}
/^function [a-zA-z]+/ {
    if (1 == match($2, "assert|test|run|runAll")) {
        next
    }
    split($2, cleanup, "(")
    printf "- %s\n", cleanup[1]
}
'
}

function run() {
    walk
}

if [ ${1} == "" ]
then
    echo "require directory path"
    exit 1
fi
run
