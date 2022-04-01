#!/bin/sh

set -euo pipefail

# download previous robot test docker image for faster builds
docker pull hsldevcom/jore4-robot:latest || echo "Previous image not found"

# build robot test docker image, using cache from previous build
docker build --cache-from=hsldevcom/jore4-robot:latest -t robot-browser .

# run the tests
docker run --rm \
  --network="host" \
  --volume "$PWD/tests":/tests \
  robot-browser \
  bash -c "robot -v ENV:$1 -v BROWSER:$2 -v PASSWORD:PLACEHOLDER -v EMAIL:PLACEHOLDER --outputdir /tests/output /tests"
