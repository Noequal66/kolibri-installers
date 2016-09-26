#!/bin/bash

if [ "$1" == "stop" ]; then
    kill -9 $(lsof -i:8080 -t) 2> /dev/null
    echo 1
    exit
fi

if [ "$1" == "status" ]; then
    if curl --output /dev/null --silent --head --fail "http://127.0.0.1:8080"; then
        echo 0
        exit
    else
        echo 1
        exit
    fi
fi