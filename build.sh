#!/bin/bash

TARGET="$1"

echo "Building docker image: $TARGET"
docker build -t "$TARGET" .

echo "Starting docker container: $TARGET"
docker run -d --rm --name my_container "$TARGET" bash -c "tail -f /dev/null"

echo "Running mock tests"
docker exec my_container bash -c "sleep 20s"


docker stop my_container

if [ -z "$ANOTHER" ]; then
    echo "ANOTHER env var is missing. Skipping that bit..."
else
    echo "ANOTHER env var is set to: $ANOTHER"
    echo "Hooray!"
fi

# if [ "$TARGET" == "c" ]; then

#     echo "You can't be build c!"
#     exit 1
# fi

exit 0