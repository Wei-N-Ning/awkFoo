#!/usr/bin/env bash

function runAll() {
    find $1 -type f \
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
    runAll $1
}

run $( pwd ) > ./README.md
git add .
git commit -a -m "automatically update readme markdown"
git push
