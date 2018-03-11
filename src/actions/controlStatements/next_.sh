#!/usr/bin/env bash

# skip the record where the 7th column holds 27
function run() {
    cat ../../_testdata/ls_out.txt | awk '
/Feb/ { 
if ($7 == 27) {
    next
}
print $0
}
'
}

run
