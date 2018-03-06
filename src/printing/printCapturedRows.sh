#!/usr/bin/env bash

function demoCapture() {
    echo "
kk
kik
k k
k_k
 kk
" | awk '/kk/ { print $0 }'
}

function run() {
    demoCapture
}

run
