#!/usr/bin/env bash

# note how it uses a variable "NetService" to refer the special file path
# not working in Wt vm (vdi) environment
function run() {
    echo "" | awk '
BEGIN {
    NetService = "/inet/tcp/0/localhost/cfinger"
    print "wning" |& NetService
    while ((NetService |& getline) > 0) {
        print $0
    }
    close(NetService)
}
'
}

run
