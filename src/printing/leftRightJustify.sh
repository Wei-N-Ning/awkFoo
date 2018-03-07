#!/usr/bin/env bash

# left justify: %-12s 
# right justify: %12s
function leftRightJustify() {
    echo "
title,year,make" |\
    awk '
BEGIN { FS = "," 
        printf "%-12s%-12s\n", "First", "Third" }
NF>1 { printf "%-12s%-12s\n", $1, $3 
       printf "%12s%12s", $1, $3 }
'
}

function run() {
    leftRightJustify
}

run
