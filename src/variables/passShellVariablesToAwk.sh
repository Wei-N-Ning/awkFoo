#!/usr/bin/env bash

# expect:
# 12 (matches only "Feb")
# 8 (matches only "Mar")
function run() {
    cat ../_testdata/ls_out.txt | awk -v pat="Feb" '
$0 ~ pat { numMatches++ }
END { print numMatches }
'
    cat ../_testdata/ls_out.txt | awk -v pat="Mar" '
$0 ~ pat { numMatches++ }
END { print numMatches }
'
}

run
