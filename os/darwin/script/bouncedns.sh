#!/bin/bash
 sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
 sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
