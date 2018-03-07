#!/usr/bin/env bash

function assertEqual() {
    if [ $1 != $2 ]
    then
        echo "failed:", $LINENO
        exit 1
    fi
}

function generateFiles {
    printf "a\nb" > /tmp/_1
    printf "a\nb\nc" > /tmp/_2
}

function getFNR() {
    local _FNR=$( awk 'END { print FNR }' /tmp/_2 /tmp/_1 )
    assertEqual 2 $_FNR
}

function getNR() {
    local _NR=$( awk 'END { print NR }' /tmp/_2 /tmp/_1 )
    assertEqual 5 $_NR
}

function run() {
    generateFiles
    getFNR
    getNR
}

run

