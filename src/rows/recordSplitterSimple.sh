#!/usr/bin/env bash

function assertEqual() {
    if [ $1 != $2 ]
    then
        echo "failed: ", $1, $2, $LINENO
        exit 1
    fi
}

function overrideRecordSplitter() {
    local _NR=$( echo "year,title,platform" | awk "BEGIN { RS=\"$1\" } END { print NR }" )
    assertEqual $2 $_NR
}

function run() {
    overrideRecordSplitter "," 3
    overrideRecordSplitter "p" 2
}

run
