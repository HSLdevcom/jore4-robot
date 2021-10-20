#!/bin/sh
docker build -t robot-browser .
  docker run --rm \
    --network="host" \
      --volume "$PWD/tests":/tests\
        robot-browser \
          bash -c "robot -v ENV:$1 -v BROWSER:$2 -v PASSWORD:PLACEHOLDER -v EMAIL:PLACEHOLDER --outputdir /tests/output /tests"
