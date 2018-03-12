#!/usr/bin/env bash

function assertRet() {
    if [ $? != 0 ]
    then
        echo "command failed to execute"
        exit 1
    fi
}

function runExpectFailure() {
    cat ../_testdata/ls_out.txt | awk '
@include "libFoo.awk"
{
    doFoo()
}
' &> /dev/null
}

# AWKPATH works like PYTHONPATH 
function runExpectSuccess() {
    AWKPATH=$( pwd )/libs awk '
@include "libFoo.awk"
{ 
    doFoo() 
}' ../_testdata/ls_out.txt > /dev/null
    assertRet
}

function run() {
    runExpectFailure
    runExpectSuccess
}

run

