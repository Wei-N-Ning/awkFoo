#!/usr/bin/env bash

function accessFieldsByNum() {
    echo "
title year platform size
" | awk '/^\w+/ { print $1 }'
}

function run() {
    accessFieldsByNum
}

run
