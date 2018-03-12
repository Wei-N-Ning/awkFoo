#!/usr/bin/env bash

# permanently adding AWKPATH for the entire script
# this won't affect the calling process
export AWKPATH=$( pwd )/libs

function assertRet() {
    if [ $? != 0 ]
    then
        echo "command failed to execute"
        exit 1
    fi
}

function runExpectSuccess() {
    awk '
@include "libFoo.awk"
{ 
    doFoo() 
}' ../_testdata/ls_out.txt > /dev/null
    assertRet
}

function run() {
    runExpectSuccess
}

run

