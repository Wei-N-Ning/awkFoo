#!/usr/bin/env bash

function useRegexForRS() {
    tail ../_testdata/ls_out.txt | awk '
BEGIN { RS = "\n|[0-9]{2}:[0-9]{2}" }
      { print $0, RT }
END   { print NR }
' 
}

function run() {
    useRegexForRS
}

run

