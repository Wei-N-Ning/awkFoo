#!/usr/bin/env bash

# expect:
# 12 (matches only "Feb")
# 8 (matches only "Mar")
# NOTE: each command line variable must be specified by -v 
function run() {
    cat ../_testdata/ls_out.txt | awk -v pat="Feb" -v notused="derr" '
$0 ~ pat { numMatches++ }
END { print numMatches }
'
    cat ../_testdata/ls_out.txt | awk -v pat="Mar" '
$0 ~ pat { numMatches++ }
END { print numMatches }
'
}

run
