#!/usr/bin/env bash

function printStaticText() {
    awk '
BEGIN { print "a test" }
'
}

function run() {
    printStaticText
}

run

