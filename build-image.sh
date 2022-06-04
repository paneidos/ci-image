#!/bin/sh

DIR="$1"
TAG=$(echo "$DIR" | tr '/' '-')

cd "$DIR"
docker build $BUILD_OPTS -t paneidos/ci-image:"$TAG" .
