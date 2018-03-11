#!/usr/bin/env bash

function recordRangeByNR() {
    echo "
1990
1991
1992
1993
1994
" | awk '
NR==1, NR==5 { print $0 }
'
}

function seudoMarkUpText() {
    echo "
<recording>
    ...
</recording>
<recording>
    ###
</recording>
" | awk '
$1 == "<recording>", $1 == "</recording>" { print $0 }
'
}

function run() {
    recordRangeByNR
    seudoMarkUpText
}

run
