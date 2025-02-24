#!/bin/bash

source $HOME/.sdkman/bin/sdkman-init.sh

sdk install java 17.0.12-zulu
sdk use java 17.0.12-zulu

# set properties
source properties.sh
echo "Recreating the project..."
# prepare project (this is required if you want to run the project from Xcode)
rm -rf platforms/*
rm -rf plugins/*
echo "Project recreated"

echo "Building the app..."
# add platform and build
./build.sh --release

echo "Build completed"
echo "Signing the apk..."
# sign the apk
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 -keystore ./printopia.keystore ./platforms/android/app/build/outputs/bundle/release/app-release.aab Printopia

echo "Signed the apk"
echo "Completed"