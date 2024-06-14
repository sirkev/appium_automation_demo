#!/bin/bash
# This script sets up Appium for iOS (XCUITest), Android (uiautomator2), and Flutter testing environments.
# It installs the latest version of Appium globally using npm, then installs drivers for XCUITest,
# Espresso, and Flutter. Finally, it starts Appium in the background and logs its output to a file named "appium.log".

# Exit immediately if a command exits with a non-zero status.
set -ex

# Install the latest version of Appium globally.
npm install -g appium@next

# Install the XCUITest driver for iOS testing.
appium driver install xcuitest

# Install the Espresso driver for Android testing.
appium driver install uiautomator2

# Install the Flutter driver for Flutter testing.
appium driver install --source=npm appium-flutter-driver

# Display the installed version of Appium.
appium -v

# Start Appium in the background, redirecting both stdout and stderr to /dev/null to suppress output,
# but also log everything to a file named "appium.log".
appium --log appium.log &>/dev/null &
