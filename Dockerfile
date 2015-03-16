FROM debian:wheezy

MAINTAINER Krisan Alfa Timur <krisan47@gmail.com>

# Enabling proxy
COPY root/etc/apt /etc/apt

# Disabling interactive mode
ENV DEBIAN_FRONTEND noninteractive

# First, install all dependencies
RUN apt-get update

RUN apt-get -y install bzip2\
    unzip\
    openssh-client\
    git\
    lib32stdc++6\
    lib32z1\
    ant\
    openjdk-7-jdk\
    wget\
    build-essential\
    curl\
    lsb-release\
    python-all\
    rlwrap\
    vim;

# Installing Node Js
RUN curl https://deb.nodesource.com/node012/pool/main/n/nodejs/nodejs_0.12.0-1nodesource1~wheezy1_amd64.deb > node.deb \
    && dpkg -i node.deb \
    && rm node.deb

# Installing Cordova Framework
RUN npm install -g cordova \
    && npm cache clear

# Install android sdk
# Use proxy instead Google Server, to make it faster
# RUN wget http://localhost:8000/android-sdk_r24.0.2-linux.tgz
RUN wget http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz
RUN tar -xvzf android-sdk_r24.0.2-linux.tgz
RUN mv android-sdk-linux /opt/android-sdk
RUN rm android-sdk_r24.0.2-linux.tgz

# Install Android tools
RUN echo y | /opt/android-sdk/tools/android update sdk --filter tool,platform-tool,build-tools-21.1.2 --no-ui -a

# Install Android Platform
#RUN echo y | /opt/android-sdk/tools/android update sdk --filter android-22 --no-ui -a

# For The Platform A.K.A SDK, mount $YOUR_ANDROID_HOME/platforms to /opt/android-sdk/platforms
# VOLUME ["/opt/android-sdk/platforms"]

# Android environment variables
ENV ANDROID_HOME /opt/android-sdk

# Executable PATH
ENV PATH $PATH:$ANDROID_HOME/tools
ENV PATH $PATH:$ANDROID_HOME/platform-tools
