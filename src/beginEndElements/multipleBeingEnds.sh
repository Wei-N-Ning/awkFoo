#!/usr/bin/env bash

# prints out 
# b1\nb2\ne1\ne2
# begin{}s and end{}s are executed in their defining order
function run() {
    echo "" | awk '
BEGIN { print "b1" }
BEGIN { print "b2" }
END { print "e1" }
END { print "e2" }
'
}

run
