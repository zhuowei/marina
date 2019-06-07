#!/bin/sh
export DYLD_ROOT_PATH=/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/
exec ./marina $@
