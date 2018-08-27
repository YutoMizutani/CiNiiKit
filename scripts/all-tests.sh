#!/bin/sh

if [ "$1" == "iOS" ]; then
	set -o pipefail && xcodebuild test -verbose -scheme "CiNiiKit iOS" -destination "platform=iOS Simulator,OS=10.0,name=iPhone 7 Plus" ONLY_ACTIVE_ARCH=NO | xcpretty
elif [ "$1" == "macOS" ]; then
	set -o pipefail && xcodebuild test -verbose -scheme "CiNiiKit macOS" ONLY_ACTIVE_ARCH=NO | xcpretty
else
	echo "wrong parameters. (iOS|macOS)"
	exit 1
fi