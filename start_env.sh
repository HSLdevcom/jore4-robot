#!/bin/bash

set -euo pipefail

# initialize package folder
mkdir -p ./docker

# compare versions
GITHUB_VERSION=$(curl -L https://github.com/HSLdevcom/jore4-flux/releases/download/e2e-docker-compose/RELEASE_VERSION.txt --silent)
LOCAL_VERSION=$(cat ./docker/RELEASE_VERSION.txt || echo "unknown")

# download latest version of the docker-compose package in case it has changed
if [ "$GITHUB_VERSION" != "$LOCAL_VERSION" ]; then
  echo "E2E docker-compose package is not up to date, downloading a new version."
  curl -L https://github.com/HSLdevcom/jore4-flux/releases/download/e2e-docker-compose/e2e-docker-compose.tar.gz --silent | tar -xzf - -C ./docker/
else
  echo "E2E docker-compose package is up to date, no need to download new version."
fi

# start up all services (and build on-demand)
docker-compose -f ./docker/docker-compose.yml -f docker-compose.override.yml up --build -d
#-f docker-compose.override.yml

# start up only some services (and build on-demand)
# docker-compose -f ./docker/docker-compose.yml up --build jore4-ui jore4-proxy

# start up only some services, in the background (and build on-demand)
# docker-compose -f ./docker/docker-compose.yml up -d --build jore4-ui jore4-proxy