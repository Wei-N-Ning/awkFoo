#!/usr/bin/env bash

# source:
# gnu.org: sed, a stream editor

function buildSUT() {
    sut=/tmp/_
    echo "there is a cow
thereisacow
there is no spoon
thereisnospoon
sub_0x23123fee1
do the right thing
break 1 if app.m_d == 13" > ${sut}
}

function printTill() {
    buildSUT

    # stop after printing line 4
    # similar to head -n 4 ${sut}
    cat ${sut} | sed 4q | wc -l
}

function processEveryNthLine() {
    buildSUT

    # print (or execute other command) every 3rd line;
    # the first two n commands skip two lines
    cat ${sut} | sed -n "n;n;p"
}

function run () {
    printTill
    processEveryNthLine
}

run
