#!/bin/bash
docker build \
    --build-arg ANDROID_API_LEVEL=29 \
    --build-arg ANDROID_BUILD_TOOLS_LEVEL=29.0.3 \
    --build-arg GRADLE_VERSION=6.1.1 \
    -t android-test .
