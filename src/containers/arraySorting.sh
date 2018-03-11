#!/usr/bin/env bash

function doSortAndGenerateAutoIndices() {
    cat ../_testdata/ls_out.txt | awk '
/Mar/ {
    arr[$9] = $0
}
END {
    n = asort(arr)
    for (i=1; i<n; i++) {
        print i, arr[i]
    }
}
'
}

function run() {
    doSortAndGenerateAutoIndices
}

run
