#!/bin/sh

DIR="$1"
TAG=$(echo "$DIR" | tr '/' '-')

cd "$DIR"
docker build -t paneidos/ci-image:"$TAG" .
