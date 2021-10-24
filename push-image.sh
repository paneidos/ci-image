#!/bin/sh

DIR="$1"
TAG=$(echo "$DIR" | tr '/' '-')

docker push paneidos/ci-image:"$TAG"
