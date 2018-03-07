#!/usr/bin/env bash

function demo() {
    mpstat | awk "
/[[:digit:].]{2,}\$/ { print \$3 , \$4 , \$5 , \$12 }
"
}

function run() {
    demo
}

run
