#!/usr/bin/env bash

function doSortAndGenerateAutoIndices() {
    cat ../_testdata/ls_out.txt | awk '
/Mar/ {
    arr[$9] = $0
}
END {
    n = asort(arr)
    for (i=1; i<=n; i++) {
        print i, arr[i]
    }
}
'
}

function doSortAndCollectUniqueElements() {
    # note that, another way to iterate the sorted elements is:
    # for (idx in paths) {
    #   print paths[idx]
    # }
    awk '
{ paths[$1] = $1 }
END {
    n = asort(paths)
    for (i=1; i<=n; i++) {
        print paths[i]
    }
}
' ../_testdata/dup_paths.txt
}

function run() {
    doSortAndGenerateAutoIndices
    doSortAndCollectUniqueElements
}

run
