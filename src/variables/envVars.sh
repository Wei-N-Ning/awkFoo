#!/usr/bin/env bash

# print $HOME
function run() {
    echo "" | awk '
BEGIN { print ENVIRON["HOME"] }'
}

run
