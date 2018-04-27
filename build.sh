#!/bin/bash

TARGET="$1"

echo "Building docker image: $TARGET"
docker build -t "$TARGET" .

echo "Starting docker container: $TARGET"
docker run -d --rm --name my_container "$TARGET" bash -c "tail -f /dev/null"

echo "Running mock tests"
docker exec my_container bash -c "sleep 20s"

docker stop my_container