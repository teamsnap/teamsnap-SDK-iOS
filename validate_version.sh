#!/bin/bash

PROJ_VER=$(/usr/libexec/PlistBuddy ./TeamSnapSDK/Info.plist -c "Print CFBundleShortVersionString")

echo "Project version: $PROJ_VER"

POD_VER=$(head ./TeamSnapSDK.podspec  | grep s.version | sed -E 's/.*\"(.*)\"/\1/')

echo "Pod version: $POD_VER"

if [ $PROJ_VER = $POD_VER ]; then
	echo "Version of project ($PROJ_VER) matches pod ($POD_VER)!"
	exit 0
else
	echo "Version of project ($PROJ_VER) does not match pod ($POD_VER)!"
	exit 1
fi