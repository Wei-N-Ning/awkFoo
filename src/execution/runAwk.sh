#!/usr/bin/env bash

function assertCommandDone() {
    if [ $? != 0 ]
    then
        printf "previous command has failed!\n"
        exit 1
    fi
}

function generateDataFiles() {
    echo "
doom 1993 dos
" > /tmp/_1
    echo "
doom2 1994 dos
" > /tmp/_2
    assertCommandDone
}

# prints three times /tmp/_1 and /tmp/_2
function runAwkWithInputFiles() {
    awk '{ print FILENAME }' /tmp/_1 /tmp/_2
    assertCommandDone
}

function runAwkStdin() {
    echo "
doom 1993 dos
" | awk ''
    assertCommandDone
}

function executeAwkScriptWithInputFiles() {
    echo "
" > /tmp/_sc.awk
    awk -f /tmp/_sc.awk /tmp/_1 /tmp/_2
    assertCommandDone
}

function run() {
    generateDataFiles
    runAwkWithInputFiles
    runAwkStdin
    executeAwkScriptWithInputFiles
}

run

