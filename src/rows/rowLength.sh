#!/usr/bin/env bash

function testFilePath() {
    local _dir=$( dirname $0 )
    printf "%s/../_testdata/%s" "$_dir" "$1"
}

function maxLineLength() {
    local data=$( testFilePath "gcc_man.txt" )
    awk '
    { if (length($0) > max) max = length($0) }
END { print max }
' $data
}

function run() {
    maxLineLength
}

run

