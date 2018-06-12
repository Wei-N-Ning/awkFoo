#!/usr/bin/env bash

setUp() {
    set -e 
}

buildSUT() {
    echo "
0       
1       int main() {
2           int b = 12;
3           if (b == 11) {
4               return 1;
5           }
6           return 0;
7       }
" > /tmp/_.c
}

runTests() {
    cat /tmp/_.c | awk '{print substr($0, 9, 999)}' > /tmp/__.c
    gcc -Wall -Werror -o /tmp/_ /tmp/__.c
}

setUp
buildSUT
runTests

