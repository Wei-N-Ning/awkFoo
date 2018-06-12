#!/usr/bin/env bash

# source:
# gnu.org: sed, a stream editor

buildSUT() {
    sut=/tmp/_
    echo "there is a cow
thereisacow
there is no spoon
thereisnospoon
sub_0x23123fee1
do the right thing
break 1 if app.m_d == 13" > ${sut}
}

# replace "sub_hex" string "%function_address%"
# $1: optional arguments
run() {
    sed ${1} 's/sub_0x[0-9]\+/\%function_address\%/g' ${sut} | awk '/function_/ {print}'
}

buildSUT
run

# substitution in-place
run -i
cat ${sut} | awk '/function_/ {print}'
