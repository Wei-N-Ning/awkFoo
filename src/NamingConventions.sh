#!/usr/bin/env bash

# Option:
# use a global associative array (a dict) to store all the 
# global vars in one place; this is Tcl's convention (Lua 
# sort of follows it too)
function run() {
    echo "" | awk '
function demo() {
    _privateVar=10
    _privateVar=Globals["counter"]
    Globals["counter"] = 33
}
BEGIN {
    SomeGlobalVar=3 
    Globals["Counter"]=0
    Globals["CurrentUser"]="wein"
}
{
    demo()
}
'
}

run
