#!/usr/bin/env bash

function assertEqual() {
    if [ $1 != $2 ]
    then
        echo "$1 != $2"
        exit 1
    fi
}

function overrideFieldSeparator() {
    local _numFields=$( echo "title,year,make,size" | awk 'BEGIN { FS = "," } { print NF }' )
    assertEqual 4 $_numFields
}

function run() {
    overrideFieldSeparator
}

run
