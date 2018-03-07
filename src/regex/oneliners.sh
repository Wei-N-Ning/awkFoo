#!/usr/bin/env bash

function test() {
    local _matched=$( echo $1 | awk "$2" )
    if [ "$_matched" = "" ]
    then
        echo "failed" $LINENO
        exit 1
    fi
}

function characterClasses() {
    test 'asd' "/[[:alnum:]]{1,}/" 
}

# note the use of BEGIN struct
# setting variable and pattern in the same line is not allowed
function ignoreCase() {
    test 'V1.5.12' "BEGIN { IGNORECASE=1 } /v[0-9.]{1,}/"
}

function run() {
    characterClasses
    ignoreCase
}

run


