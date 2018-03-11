#!/usr/bin/env bash

# if statement add per-record level control flow
# in this case only the file record with size being 
# 27 is shown
# note how awk accepts the indentation and line break
function run() {
    cat ../../_testdata/ls_out.txt | awk '
/Feb/ { 
    if ($7 == 27)
        print $0
}
'
}

run
