#!/bin/sh
set -euxo pipefail

DOCKER_BUILDKIT=1
VERSION=$1
docker build --build-arg PBANDK_VERSION=$VERSION -t plugins.buf.build/julienfouilhe/pbandk:v$VERSION .
docker push plugins.buf.build/julienfouilhe/pbandk:v$VERSION