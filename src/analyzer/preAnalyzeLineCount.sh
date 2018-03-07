#!/usr/bin/env bash

function preAnalyzeLineCount() {
    local ifile="../_testdata/ls_out.txt"
    awk -v nlines=$( wc -l < $ifile ) '
NF > 3 { printf "%s", $3"-"$6 }
NF > 3 && NR != nlines { printf ",\n" }
' $ifile
}

function run() {
    preAnalyzeLineCount
}

run
