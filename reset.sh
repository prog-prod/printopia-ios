#!/bin/bash
source $HOME/.sdkman/bin/sdkman-init.sh

sdk install java 17.0.12-zulu
sdk use java 17.0.12-zulu

# set properties
source properties.sh

cordova clean

# prepare project (this is required if you want to run the project from Xcode)
cordova platform remove ios

rm -rf platforms/*
rm -rf plugins/*


# add plugins
cordova plugin add cordova-plugin-firebasex

# add platform and build
./build.sh