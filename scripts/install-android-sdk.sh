#!/bin/bash

set -e #stop immediately if any error happens

# Install Open JDK SDK
sudo apt update
sudo apt install openjdk-8-jdk -y
sudo update-java-alternatives --set java-1.8.0-openjdk-amd64

java -version

# Install SDK Manager
sudo apt-get install android-sdk
sudo apt-get install sdkmanager


# Install android command line tools
#can be found at https://developer.android.com/studio/index.html#downloads android studio downloads section (command line tools only)
cd ~ && wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
ANDROID_HOME=/opt/androidsdk
mkdir -p $ANDROID_HOME
sudo apt install unzip -y && unzip commandlinetools-linux-11076708_latest -d $ANDROID_HOME

echo "export ANDROID_HOME=$ANDROID_HOME" >> ~/.bashrc
echo 'export SDK=$ANDROID_HOME' >> ~/.bashrc
echo 'export PATH=$SDK/emulator:$SDK/tools:$SDK/tools/bin:$SDK/platform-tools:$PATH' >> ~/.bashrc
# shellcheck disable=SC1090
source ~/.bashrc

# Install Android Image version 31
yes | sudo sdkmanager --install 'build-tools;33.0.0' platform-tools 'platforms;android-31'

sudo sdkmanager --list
yes | sudo sdkmanager --install 'system-images;android-31;default;x86_64' --channel=0 > /dev/null

emulator -version

echo "INSTALL ANDROID SDK DONE!"
