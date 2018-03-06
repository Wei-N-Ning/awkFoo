#!/usr/bin/env bash

function testFilePath() {
    printf "%s/../_testdata/%s" "$( dirname $0 )" "$1"
}

function countRows() {
    local data=$( testFilePath "ls_out.txt" )
    awk '
$6 == "Feb" { sum += 1 }
END { print sum }
' $data
}

function run() {
    countRows
}

run

