#!/usr/bin/env bash

function run() {
    echo "" | awk '
BEGIN {
    while (("/inet/tcp/0/localhost/8888" |& getline) > 0) {
        print $0
    }
    close("/inet/tcp/0/localhost/8888")
}'
}

run
