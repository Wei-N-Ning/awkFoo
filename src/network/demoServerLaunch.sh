#!/usr/bin/env bash

function launchSrv() {
    echo "" | awk '
BEGIN {
    RS = ORS = "\n"
    service = "/inet/tcp/8888/0/0"
    body = "<HTML><HEAD>" \
           "<TITLE>aa</TITLE></HEAD>" \
           "<BODY>AA</BODY></HTML>"
    size = length(body) + length(ORS)
    print "HTTP/1.0 200 OK" |& service
    print "Content-Length: " size ORS |& service
    print body |& service
    while ((service |& getline) > 0) {
        print $0
    }
    close(service)
}
' &
}

function pingSrv() {
    curl -X GET http://localhost:8888
}

launchSrv
sleep 0.1
pingSrv

