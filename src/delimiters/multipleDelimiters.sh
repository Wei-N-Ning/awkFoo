#!/usr/bin/env bash

function run() {
    env | awk '
BEGIN {
    FS="[= ,:]"
}
{
    print $1
}
'
}

run
