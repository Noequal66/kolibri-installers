#!/bin/bash

if curl --output /dev/null --silent --head --fail "http://127.0.0.1:8080"; then
  echo true
else
  echo false
fi