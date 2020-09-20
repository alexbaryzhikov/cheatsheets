#!/bin/bash

PROJECT_DIR=/home/alex/Dev/SafePhone/Production/safe-monitor
KEYSTORE_DIR=/home/alex/KeyStore
KEYSTORE_NAME=keystore
DOCKER_IMAGE=android-test
GRADLE_TASK=testDebugUnitAndAndroid 

cd "$PROJECT_DIR" && \
docker run --privileged -it --rm \
    -v "$PWD:/project" \
    -v "$KEYSTORE_DIR:/keystore" \
    -e ANDROID_KEYSTORE="/keystore/$KEYSTORE_NAME" \
    -e ANDROID_KEYSTORE_PASS='FdGh!2#$%1' \
    -e ANDROID_KEYSTORE_ALIAS="niisokb" \
    -e ANDROID_KEYSTORE_ALIAS_PASS='Fvbb871@@3' \
    $DOCKER_IMAGE \
    bash -c "/start_emulator.sh && gradlew $GRADLE_TASK -p /project"
