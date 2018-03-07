#!/usr/bin/env bash

function changeStringAndNumericField() {
    echo "1992 6.0 31 12
" | awk '
/^\w+/ { $3 = "doom"
         $4 = $4 + 10
         print $3, $4 }'
}

function run() {
    changeStringAndNumericField
}

run
