#!/bin/bash

#Commands
## List all connected devices: adb devices
## List all packages: adb shell cmd package list packages
## Uninstall package: adb uninstall --user 0 <package-name>

facebookPackages=(
  "com.facebook.orca" # Facebook Messenger
  "com.facebook.katana" # Facebook Android App
  "com.example.facebook"
  "com.facebook.android"
  "com.facebook.services"
  "com.facebook.system"
  "com.facebook.appmanager"
)

instagramPackages=(
  "com.instagram.android"
)

case $1 in

  "all")
    packageArray=($(echo ${facebookPackages[*]}) $(echo ${instagramPackages[*]}))
    ;;

  "facebook")
    packageArray=($(echo ${facebookPackages[*]}))
    ;;

  "instagram")
    packageArray=($(echo ${instagramPackages[*]}))
    ;;

  *)
    packageArray=()
    ;;
esac

if [ ${#packageArray[@]} -eq 0 ]; then
    echo "No params received. Provide: all, facebook or instagram"
    exit
fi

cmdDevices=$(adb devices)
echo "$cmdDevices"
echo

for item in ${packageArray[@]}
do
  echo "Uninstall : $item"
  adb uninstall --user 0 $item
  echo "$cmdUninstall"
  echo
done

echo "-- Done --"