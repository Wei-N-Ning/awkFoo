#!/usr/bin/env bash

function getUserBlob() {
    curl -s "https://api.github.com/users/powergun" |\
    awk 'NR > 0 { print }' |\
    python -c "import json,sys;print json.load(sys.stdin)"
}

function run() {
    getUserBlob
}

run
