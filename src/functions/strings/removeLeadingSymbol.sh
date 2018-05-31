#!/usr/bin/env bash


buildTexts() {
    cat > /tmp/_.txt <<EOF
> something
>    for this
>      do that
> # title
EOF
}

runTests() {
    cat /tmp/_.txt | awk '{ split($R, result, "> "); print result[2] }'
}

buildTexts
runTests

