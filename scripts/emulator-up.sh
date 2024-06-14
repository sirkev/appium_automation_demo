#!/bin/bash
set -e #stop immediately if any error happens

avd_name=$1

if [[ -z "$avd_name" ]]; then
  avd_name="avd29"
fi

#check if emulator works well
emulator -version

# create virtual device, default using Android 10 image (API Level 29)
echo no | avdmanager create avd -n avd28 -k "system-images;android-29;google_apis;x86_64"

# start the emulator
emulator -avd avd28 -no-audio -no-window -no-accel &

# show connected virtual device
adb devices
