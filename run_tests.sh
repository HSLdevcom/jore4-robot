#!/bin/sh

set -euo pipefail

# download previous robot test docker image for faster builds
docker pull hsldevcom/jore4-robot:latest || echo "Previous image not found"

# build robot test docker image, using cache from previous build
docker build --cache-from=hsldevcom/jore4-robot:latest -t robot-browser .

# read the password and email values from the '.env' file
export $(cat .env | xargs)

TEST_ENVIRONMENT=$1
TEST_BROWSER=$2
INCLUDE_TAGS=${3:-*}

# run the tests
docker run --rm \
  --network="host" \
  --volume "$PWD/tests":/tests \
  robot-browser \
  bash -c "robot -v ENV:$TEST_ENVIRONMENT -v BROWSER:$TEST_BROWSER -v PASSWORD:$E2E_USER_PASSWORD -v EMAIL:$E2E_USER_USERNAME --outputdir /tests/output --include \"$INCLUDE_TAGS\" /tests"