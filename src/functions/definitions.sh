#!/usr/bin/env bash

function run() {
    echo "" | awk '
function foobar() {
    return "foobar"
}
function fooargs(lhs, rhs) {
    return lhs * rhs * 10
}
{
    print foobar()
    print fooargs(10, 0.01)
}
'
}

run

