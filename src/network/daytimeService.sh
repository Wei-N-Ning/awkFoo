#!/usr/bin/env bash

# /etc/services:
# names such as "daytime" are just mnemonics for predetermined 16bit
# ints.
# only root could enter new service with a name
function run() {
    echo "" | awk '
BEGIN {
    service = "/inet/tcp/8888/0/0"
    print ";", strftime() |& service
    close(service)
}
'
}

run
