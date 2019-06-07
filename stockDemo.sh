#!/bin/sh
set -e
export DEVELOPER_DIR=/Applications/Xcode-beta.app/Contents/Developer
SWIFTFLAGS="-sdk /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator13.0.sdk -target x86_64-apple-ios13.0-simulator"
subdir="WorkingWithUIControls_StartingPoint/Landmarks/Landmarks"
swiftc $SWIFTFLAGS -o marina mainstock/main.swift marina.swift marina_html.swift \
	$subdir/CategoryRow.swift $subdir/Home.swift $subdir/LandmarkDetail.swift \
	$subdir/models/* $@
./run.sh
