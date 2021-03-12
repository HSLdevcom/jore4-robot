#!/bin/sh
docker build -t robot-browser .
 docker run --rm \
     robot-browser \
       bash -c "robot -v BROWSER:$1 --outputdir /tests/results /tests"
