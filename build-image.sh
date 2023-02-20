#!/bin/sh

IMAGE="$(dirname $1)"
TAG=$(echo "$IMAGE" | tr '/' '-')
DIR="$(dirname $IMAGE)"
BUILD_ARG="$(basename $IMAGE | sed 's/\([a-z]\)\([0-9]\)/\1=\2/')"

cd "$DIR"
docker build $BUILD_OPTS --build-arg "$BUILD_ARG" -t paneidos/ci-image:"$TAG" .
