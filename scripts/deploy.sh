#!/usr/bin/env bash

# Login to docker hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker build --build-arg WATERFALL_CI_BUILDNUMBER=$WATERFALL_CI_BUILDNUMBER_CI_BUILDNUMBER -t felixklauke/waterfall:$WATERFALL_VERSION_TAG .
docker push felixklauke/waterfall:$WATERFALL_VERSION_TAG
