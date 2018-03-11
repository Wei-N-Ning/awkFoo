#!/usr/bin/env bash

# print each matched record twice
function run() {
    cat ../../_testdata/ls_out.txt | awk '
/Mar/ {
    i = 2
    while (i > 0) {
        i--
        print $0
    }
}
'
}

run

