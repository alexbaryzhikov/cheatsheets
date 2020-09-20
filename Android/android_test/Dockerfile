FROM ubuntu

WORKDIR /
SHELL ["/bin/bash", "-c"]
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow

RUN apt-get update && apt-get install -y openjdk-8-jdk vim git unzip libglu1 libpulse-dev libasound2 \
libc6 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxi6 libxtst6 libnss3 wget

ARG ANDROID_API_LEVEL=29
ARG ANDROID_BUILD_TOOLS_LEVEL=29.0.3
ARG GRADLE_VERSION=6.1.1

RUN wget --no-verbose "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -P /tmp \
&& unzip -d /opt/gradle /tmp/gradle-${GRADLE_VERSION}-bin.zip \
&& mkdir /opt/gradlew \
&& /opt/gradle/gradle-${GRADLE_VERSION}/bin/gradle wrapper --gradle-version ${GRADLE_VERSION} --distribution-type all -p /opt/gradlew \
&& /opt/gradle/gradle-${GRADLE_VERSION}/bin/gradle wrapper -p /opt/gradlew 

RUN wget --no-verbose "https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip" -P /tmp \
&& mkdir -p /opt/android/cmdline-tools \
&& unzip -d /opt/android/cmdline-tools /tmp/commandlinetools-linux-6609375_latest.zip

RUN yes Y | /opt/android/cmdline-tools/tools/bin/sdkmanager \
    "platform-tools" \
    "emulator" \
    "platforms;android-${ANDROID_API_LEVEL}" \
    "system-images;android-${ANDROID_API_LEVEL};google_apis;x86" \
    "build-tools;${ANDROID_BUILD_TOOLS_LEVEL}" \
&& yes Y | /opt/android/cmdline-tools/tools/bin/sdkmanager --licenses \
&& echo "no" | /opt/android/cmdline-tools/tools/bin/avdmanager \
    --verbose create avd --force \
    --name "test-pixel" \
    --device "pixel" \
    --package "system-images;android-${ANDROID_API_LEVEL};google_apis;x86" \
    --tag "google_apis" \
    --abi "x86"

ENV ANDROID_HOME=/opt/android
ENV GRADLE_HOME=/opt/gradle/gradle-$GRADLE_VERSION
ENV PATH=$GRADLE_HOME/bin:/opt/gradlew:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/tools/bin:$ANDROID_HOME/platform-tools:$PATH
ENV LD_LIBRARY_PATH=$ANDROID_HOME/emulator/lib64:$ANDROID_HOME/emulator/lib64/qt/lib

COPY start_emulator.sh /
RUN chmod +x start_emulator.sh && sed -i 's/\r$//' start_emulator.sh 
