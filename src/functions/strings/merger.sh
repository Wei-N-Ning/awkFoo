#!/usr/bin/env bash

function run() {
    echo "" | awk '
function join(arr, sep) {
    s = ""
    _sep = ""
    for (idx in arr) {
        s = s _sep arr[idx]
        _sep = sep
    }
    return s
}
{
    arr[0] = "doom"
    arr[1] = "1993"
    arr[2] = "dos"
    print join(arr, "|")
}
'
}

run

