#!/usr/bin/env bash

function defineVariablesInCommandLine() {
    awk -v title="dd" -v year="1992" '
BEGIN { print title, year }
'
}

function run() {
    defineVariablesInCommandLine
}

run

