#!/usr/bin/env bash

# returns 2 (string position starts from 1)
function stringIndex() {
    echo "" | awk '
{
    print index("doom", "oo")
}
'
}

# returns 4
function stringLength() {
    echo "" | awk '
{
    print length("doom")
}
'
}

# returns:
# 6 (match digits) NOTE: awk's character set is different to Python's
# 
function stringMatch() {
    echo "" | awk '
{
    print match("doom 1992", "[[:digit:]]+")
}
'
}

function run() {
    stringIndex
    stringLength
    stringMatch
}

run
