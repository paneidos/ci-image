#!/bin/sh

IMAGE="$(dirname $1)"
TAG=$(echo "$IMAGE" | tr '/' '-')
DIR="$(dirname $IMAGE)"

docker push paneidos/ci-image:"$TAG"
