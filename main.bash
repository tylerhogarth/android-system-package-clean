#!/bin/bash

#Commands
## List all connected devices: adb devices
## List all packages: adb shell cmd package list packages
## Uninstall package: adb uninstall --user 0 <package-name>

packageArray=(
  "com.facebook.orca" # Facebook Messenger
  "com.facebook.katana" # Facebook Android App
  "com.example.facebook"
  "com.facebook.android"
  "com.instagram.android"
)

cmdDevices=$(adb devices)
echo -e "$cmdDevices"

for item in ${packageArray[@]}
do
  echo "Uninstall : $item"
  adb uninstall --user 0 $item
  echo -e "$cmdUninstall\n"
done

echo "-- Done --"