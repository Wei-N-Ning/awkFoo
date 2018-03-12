#!/usr/bin/env bash

function run() {
    echo "" | awk '
BEGIN {
    RS = ORS = "\r\n"
    service = "/inet/tcp/0/192.168.180.1/80"
    print "GET http://107.170.4.117" |& service
    while ((service |& getline) > 0) {
        print $0
    }
    close(service)
}'
}

run
