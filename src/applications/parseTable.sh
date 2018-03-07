#!/bin/bash

echo "
------------+-------+----
 doom 1992  |  dos  | asd
------------+-------+----
 e1m1       | 1992.1| bsd
 e2m1       | 1992.1| bsd
 e3m2       | 1992.2| bsd
 e3m3       | 1992.3| bsd
 e3m4       | 1992.5| bsd" | tail -n 1 | awk '
{ 
    split($0,a,"|")
    if(length(a[1]) > 1) {
        K = a[1]; 
        print K
    }
}
'
