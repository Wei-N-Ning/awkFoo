#!/usr/bin/env bash

# effective awk P68 (92) 
# it is also possible to send output to a program through a pipe
# instead of into a file
# this type of redirection opens a pipe to command and writes
# the values of items through this pipe to a process created
# to execute command
function redirectOutputToPipe() {
    cat ../_testdata/ls_out.txt |\
    awk '
{ print "placeholder" }
' | wc -l
}

function run() {
    redirectOutputToPipe
}

run
