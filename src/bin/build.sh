#!/usr/bin/env bash

TWGIT="twgit"

cd ../docker/
docker rmi ${TWGIT}
docker build -t ${TWGIT} .
