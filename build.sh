#!/bin/bash

# set properties
source properties.sh


# prepare project (this is required if you want to run the project from Xcode)
cordova platforms add ios


# build the project
cordova build $PLATFORM $@

cp ./PrivacyInfo.xcprivacy ./platforms/$PLATFORM/$APP_NAME/PrivacyInfo.xcprivacy
