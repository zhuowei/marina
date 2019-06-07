#!/bin/sh
set -e
export DEVELOPER_DIR=/Applications/Xcode-beta.app/Contents/Developer
SWIFTFLAGS="-sdk /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator13.0.sdk -target x86_64-apple-ios13.0-simulator"
subdir="LandmarkTutorial3Complete/Landmarks/Landmarks"
swiftc $SWIFTFLAGS -o marina mainlandmark/main.swift marina.swift marina_html.swift \
	$subdir/LandmarkList.swift \
	$subdir/LandmarkDetail.swift \
	$subdir/Supporting\ Views/LandmarkRow.swift \
	$subdir/Supporting\ Views/CircleImage.swift \
	$subdir/Models/* $@
./run.sh
