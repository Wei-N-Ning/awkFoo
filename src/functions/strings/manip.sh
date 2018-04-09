#!/usr/bin/env bash

# returns 2 (string position starts from 1)
function stringIndex() {
    echo "" | awk '
{
    print index("doom", "oo")
}
'
}

# match() returns 0 (no-match) or N (position of seq) 
function stringStartswith() {
    echo "" | awk '
{ print "doomlib: ", match("-Ldoomlib", "^\\-") }
'
}

# returns 4
function stringLength() {
    echo "" | awk '
{
    print length("doom")
}
'
}

# returns:
# 6 (match digits) NOTE: awk's character set is different to Python's
# 
function stringMatch() {
    echo "" | awk '
{
    print match("doom 1992", "[[:digit:]]+")
}
'
}

function stringSplit() {
    echo "" | awk '
{
    print split("doom doom2 doom3", arr, " ")
    for (idx in arr) {
        print idx, arr[idx]
    }
}
'
}

function stringFormat() {
    echo "" | awk '
{
    print sprintf("%.4f", 3.1415926)
}
'
}

function stringToNum() {
    echo "" | awk '
{
    print sprintf("%.2f", strtonum("3.1415926535"))
}
'
}

# sub will process only the leftmost matched text;
# gsub will process all the matched texts;
# recall these two functions in Lua
# gensub is a generator, not a modifier;
function stringSub() {
    echo "" | awk '
{
    sut = "doom doom2 doom3 doom2016"
    print gsub(/[0-9]{1,}/, "AAA", sut)
    print gensub(/AAA/, "BBB", "g", sut)
    print sut
}
'
}

# this also DESTROYS the Python indentation
function removeLeadingNumber() {
    echo "
   51 # Do some modification to the TimeWarp
   52 if lTimeWarp.FCurve:
   53     lFCurve = lTimeWarp.FCurve
" | awk '{ print gensub(/^[0-9 ]{2,}/, "", "g", $0) }'
}

# this preserve the Python indentation
function removeLeadingNumberPreserveInd() {
    echo "
   51 # Do some modification to the TimeWarp
   52 if lTimeWarp.FCurve:
   53     lFCurve = lTimeWarp.FCurve
" | awk -F "" '{ print gensub(/^   [0-9]{2,} /, "", "g", $0) }'
}

function stringSubString() {
    echo "" | awk '
{
    print substr("doom 1992", 4, 4)
}
'
}

function stringChangeCases() {
    echo "" | awk '
{
    print tolower("Iddqd")
    print toupper("idkfa")
}
'
}

function run() {
    stringIndex
    stringStartswith
    stringLength
    stringMatch
    stringSplit
    stringFormat
    stringToNum
    stringSub
    removeLeadingNumber
    removeLeadingNumberPreserveInd
    stringSubString
    stringChangeCases
}

run
