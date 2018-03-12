#!/usr/bin/env bash

# Option:
# use a global associative array (a dict) to store all the 
# global vars in one place; this is Tcl's convention (Lua 
# sort of follows it too)
function run() {
    echo "" | awk '
function demoVariableName() {
    _privateVar=10
    _privateVar=Globals["counter"]
    Globals["counter"] = 33
}
function strProcess() {
}
function lib_strProcess() {
}
BEGIN {
    SomeGlobalVar=3 
    Globals["Counter"]=0
    Globals["CurrentUser"]="wein"
}
{
    demoVariableName()
    strProcess()
    lib_strProcess()
}
'
}

run
