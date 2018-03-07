#!/usr/bin/env bash

function assertEqual() {
    if [ "$1" != "$2" ]
    then
        echo "$1 != $2"
        exit 1
    fi
}

function printStaticText() {
    awk 'BEGIN { print "atest" }'
}

function printConcatenatedVariables() {
    echo "title,year,make" | awk 'BEGIN { FS = "," } NF > 1 { print $1 $2 }'
}

function run() {
    assertEqual "atest" $( printStaticText )
    assertEqual "titleyear" $( printConcatenatedVariables )
}

run

