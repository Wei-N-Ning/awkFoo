#!/usr/bin/env bash

# example: 
# if I change the width of the first column to 1, only w is printed
# if I increase the width to 10 it will include the trailing whitespace,
# and also include the character "p" in the next column
function createScript() {
    echo '
BEGIN { FIELDWIDTHS = "9 1 1 1 1 1 1" }
NR > 2 { print "<" , $1 , ">" }
' > /tmp/_.awk
}

function run() {
    createScript
    cat ../_testdata/w_out.txt | awk -f /tmp/_.awk
}

run

