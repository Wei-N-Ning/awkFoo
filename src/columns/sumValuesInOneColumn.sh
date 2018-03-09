#!/usr/bin/env bash

function run() {
    echo "
232     File0711.jpg
516     File0712.jpg
392     File0713.jpg
440     File0714.jpg
356     File0715.jpg
396     File0716.jpg
284     File0717.jpg
224     File0718.jpg
360     File0719.jpg
540     File0720.jpg
548     File0721.jpg
456     File0722.jpg
388     File0723.jpg
424     File0724.jpg
228     File0725.jpg
" | awk '
/^[0-9]+/ { size = size + int( $1 ) }
END             { print size }
'
}

run
