#!/bin/sh
export DEVELOPER_DIR=/Applications/Xcode-beta.app/Contents/Developer
exec swiftc marina.swift $@
