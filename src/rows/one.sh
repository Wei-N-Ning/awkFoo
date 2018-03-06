#!/usr/bin/env bash


# print START and END before and after the main text
echo "
asdasdsad
" | awk '
BEGIN { print "START" }
      { print }
END   { print "END" }
'


# print the timestamp and the owner of each file
ls -l /tmp | awk '
BEGIN { print "START" }
      { print $8, "\t", $3 }
END   { print "END" }
'
