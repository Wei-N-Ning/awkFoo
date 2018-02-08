#!/bin/bash

# split by whitespace; print the 1st and 5th column
echo "
aa bb cc dd doom-1993
" | awk '
{ print $1, $5 }
'

