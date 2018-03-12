#!/usr/bin/env bash

function run() {
    /usr/bin/env bash ./sender.sh &
    sleep 0.1
    /usr/bin/env bash ./receiver.sh
}

run
