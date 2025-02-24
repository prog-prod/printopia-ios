#!/bin/bash

# set properties
source properties.sh


# prepare project (this is required if you want to run the project from Xcode)
cordova platforms add ios


# build the project
cordova build $PLATFORM $@

cp ./PrivacyInfo.xcprivacy ./platforms/$PLATFORM/$APP_NAME/PrivacyInfo.xcprivacy

# Копируем PrivacyInfo.xcprivacy в GoogleSignIn
mkdir -p platforms/ios/Pods/GoogleSignIn/GoogleSignIn/Resources
cp ./outdated/GoogleSignIn/PrivacyInfo.xcprivacy platforms/ios/Pods/GoogleSignIn/GoogleSignIn/Sources/Resources/PrivacyInfo.xcprivacy && echo "GoogleSignIn PrivacyInfo.xcprivacy added."

# Копируем PrivacyInfo.xcprivacy в GTMAppAuth
mkdir -p platforms/ios/Pods/GTMAppAuth/GTMAppAuth/Resources
cp ./outdated/GTMAppAuth/PrivacyInfo.xcprivacy platforms/ios/Pods/GTMAppAuth/GTMAppAuth/Sources/Resources/PrivacyInfo.xcprivacy && echo "GTMAppAuth PrivacyInfo.xcprivacy added."


#cd platforms/ios && pod update GoogleSignIn GTMAppAuth --repo-update
