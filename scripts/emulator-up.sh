#!/bin/bash
set -e #stop immediately if any error happens

avd_name=$1

if [[ -z "$avd_name" ]]; then
  avd_name="pixel_6_pro"
fi

#check if emulator works well
emulator -version

# create virtual device, default using Android 10 image (API Level 29)
echo no | avdmanager --verbose create avd --force --name "pixel_6_pro" --package "system-images;android-31;google_apis;x86_64" --tag "google_apis" --abi "x86_64" --device "pixel_6_pro"

# start the emulator
emulator -avd avd_name -no-audio -no-window -no-accel &

# show connected virtual device
adb devices
