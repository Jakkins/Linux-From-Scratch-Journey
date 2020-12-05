#!/bin/bash

clear

first=$1
second=$2
third=$3

expect <<- END
    spawn "/foo/bar
    expect "Choose an option"
    send "$first\r"
    expect "Choose an option"
    send "$second\r"
    expect "Choose an option"
    send "$third\r"
END
