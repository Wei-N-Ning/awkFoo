#!/usr/bin/env bash

# collect the matching lines in an array and iterate over the elements
# in the END section
function array() {
    cat ../_testdata/ls_out.txt | awk '
/Feb/ {
    arr[n] = $0
    n++
}
END {
    for (i=1; i<=n; i++) {
        print arr[i]
    }
}
'
}

# WARNING:
# the order of the elements are not guaranteed!!
# the order can NOT be controlled
# is not predictable
function arrayBasedForLoop() {
    cat ../_testdata/ls_out.txt | awk '
/Mar/ {
    arr[n] = $0
    n++
}
END {
    for (idx in arr) {
        print idx
    }
}
'
}

# to delete the whole array more efficiently:
# delete arr
function deleteArrayElements() {
    cat ../_testdata/ls_out.txt | awk '
/Mar/ {
    arr[n] = $0
    n++
}
END {
    for (idx in arr) {
        delete arr[idx]
    }
    for (idx in arr) {
        print "@@@@@@@@", idx
    }
}
'
}

function run() {
    array
    arrayBasedForLoop
}

run
