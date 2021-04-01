#!/bin/sh
docker build -t robot-browser .
 docker run --rm \
    --volume "$PWD/results":/tests/Results \
     robot-browser \
       bash -c "robot -v ENV:$1 -v BROWSER:$2 --outputdir /tests/Results /tests"
