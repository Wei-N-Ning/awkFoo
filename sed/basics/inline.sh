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

function oneWord() {
    # strict word-to-word match
    # note that the second word doom2 is not a match
    echo 'doom doom2' | sed 's/doom/DooM/' | tee /tmp/_ >/dev/null

    # edit file /tmp/_ (i)nplace
    sed -i 's/DooM/doom/' /tmp/_
    cat /tmp/_
}

function printNLines() {
    buildSUT

    # -n disable the automatic printing of the resulting text,
    # therefore only the 'p' command is in effect

    # print line 5 (like awk, sed counts from 1)
    sed -n "5p" ${sut} >/dev/null

    # print line 5 to 7
    sed -n "5,7p" ${sut} >/dev/null

    # print the remaining lines after deleting line 2 to 7
    # note that it is using the default automatic printing again
    sed "2,70d" ${sut}

    # print the line using a regex test /REGEX/
    # p is the command
    sed -n "/^sub_/p" ${sut}
}

function multipleCommands() {
    buildSUT

    sed "
/^there/d;
6,7d;
s/sub/MO.MO.MO/
" ${sut}
}

function run() {
    oneWord
    printNLines
    multipleCommands
}

run