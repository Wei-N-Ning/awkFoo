#!/usr/bin/env bash
# the output from an entire print statement is called an
# output record;
# each print statement outputs one output record

function outputRecordSeparator() {
    echo '
title,year,make
dpd-200,1993,NEC
' | awk '
BEGIN { FS = ","
        OFS = "    "
      }
NF>1 { print $1, $2 }
'
}

function run() {
    outputRecordSeparator
}

run

