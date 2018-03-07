#!/usr/bin/env bash

function assertFileExists() {
    if [ ! -f $1 ]
    then
        printf "file: %s does not exist\n" $1
        exit 1
    fi
}

function redirectToTwoFiles() {
    cat ../_testdata/ls_out.txt |\
    awk '
NF>3 { printf "%10s%10s\n", $3, $4 > "/tmp/_1"
       printf "%10s%10s\n", $6, $8 > "/tmp/_2"
     }
'
    assertFileExists /tmp/_1
    assertFileExists /tmp/_2
}

function run() {
    redirectToTwoFiles
}

run
