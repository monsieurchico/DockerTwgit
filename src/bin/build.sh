#!/usr/bin/env bash

source ../conf/common.sh

cd ../docker/
docker rmi ${TWGIT}
docker build -t ${TWGIT} .
