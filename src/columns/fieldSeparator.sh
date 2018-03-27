#!/usr/bin/env bash

function assertEqual() {
    if [ $1 != $2 ]
    then
        echo "$1 != $2"
        exit 1
    fi
}

# use -F to specify multiple field separator
function overrideFieldSeparator() {
    local _numFields=$( echo "title,year make&size" | awk -F'[,& ]' '{ print NF }' )
    assertEqual 4 $_numFields
}

function run() {
    overrideFieldSeparator
}

run
