#!/bin/sh
export DEVELOPER_DIR=/Applications/Xcode-beta.app/Contents/Developer
SWIFTFLAGS="-sdk /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator13.0.sdk -target x86_64-apple-ios13.0-simulator"
exec swiftc $SWIFTFLAGS -o marina main.swift marina.swift marina_html.swift $@
