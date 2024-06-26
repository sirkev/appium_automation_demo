#!/bin/bash
# This script sets up Appium for iOS (XCUITest), Android (uiautomator2), and Flutter testing environments.
# It installs the latest version of Appium globally using npm, then installs drivers for XCUITest,
# uiautomator2, and Flutter. Finally, it starts Appium in the background and logs its output to a file named "appium.log".

# Exit immediately if a command exits with a non-zero status.
set -ex

#install appium python client
pip install Appium-Python-Client

# Install the latest version of Appium globally.
npm i --location=global appium

# Install the XCUITest driver for iOS testing.
appium driver install xcuitest

# Install the uiautomator2 driver for Android testing.
appium driver install uiautomator2

# Install the Flutter driver for Flutter testing.
appium driver install --source=npm appium-flutter-driver

#install appium reporting plugin
appium plugin install --source=npm appium-reporter-plugin

# Confirm the installed version of Appium.
appium -v

# Starts Appium in the background, redirecting both stdout and stderr to /dev/null to suppress output,
# but also log everything to a file named "appium.log".
appium --use-plugins=appium-reporter-plugin --log appium.log &>/dev/null &
