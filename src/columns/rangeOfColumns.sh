#!/usr/bin/env bash

# hack /1
function setUnwantedColumnsEmpty() {
    echo "doom doom2 doom3 doom4" | awk '
{
    $1=$2=""
    print $0
}
'
}

setUnwantedColumnsEmpty
