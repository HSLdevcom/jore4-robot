#!/bin/sh
docker build -t robot-browser .
 docker run --rm \
    --volume "$PWD/tests":/tests\
     robot-browser \
       bash -c "robot -v ENV:$1 -v BROWSER:$2 --outputdir /tests/output /tests"
