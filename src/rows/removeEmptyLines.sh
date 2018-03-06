#!/usr/bin/env bash

function removeEmptyLines() {
    echo "
dd

d

ttt


" | awk 'NF > 0'
}

function run() {
    removeEmptyLines
}

run

