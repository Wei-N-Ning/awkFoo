#!/usr/bin/env bash

function run() {
    echo "
something
other thing
" > /tmp/_
    awk '
function assert(condition, message) {
    if (! condition) {
        printf("%s:%d: assertion failed: %s\n", 
            FILENAME, FNR, message) > "/dev/stderr"
        _assert_exit=1
        exit 1
    }
}
{
    n=1
    assert(n == 2)
}
END {
    if (_assert_exit) {
        exit 1
    }
}
' /tmp/_
}

run

