#!/usr/bin/env bash

function run() {
    echo "" | awk '
BEGIN {
    for (i=1; i<3; i++) {
        print ENVIRON["HOST"] |& "/inet/tcp/8888/0/0"
    }
    close ("/inet/tcp/8888/0/0")
}
'
}

run
