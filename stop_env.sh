#!/bin/bash

set -euo pipefail

docker-compose -f ./docker/docker-compose.yml -f docker-compose.override.yml down
