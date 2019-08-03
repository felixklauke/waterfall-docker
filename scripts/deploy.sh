#!/usr/bin/env bash

# Login to docker hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker build --build-arg WATERFALL_VERSION=$WATERFALL_VERSION -t felixklauke/waterfall:$WATERFALL_VERSION .
docker push felixklauke/waterfall:$WATERFALL_VERSION
