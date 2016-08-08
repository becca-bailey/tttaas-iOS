# Becca and Tom's iOS Tic Tac Toe [![Build Status](https://travis-ci.org/beccanelson/tttaas-iOS.svg?branch=master)](https://travis-ci.org/beccanelson/tttaas-iOS)
This is the iOS front-end of a tic-tac-toe application built in Clojure.

## Dependencies:
+ [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12)
+ [Cocoapods](https://cocoapods.org/)

## Project Setup:

+ Clone this repository

+ If you don't already have cocoapods on your computer: `brew install cocoapods`

## To Play:

+ Open `tttaas-iOS/iOS-tic-tac-toe.xcworkspace` in Xcode.

+ Inside Xcode, you can build the project in the simulator or a device using the build button in the upper left corner.

**Alternately, to build and test the project in the command line:**

`xcodebuild -workspace iOS-tic-tac-toe.xcworkspace -scheme iOS-tic-tac-toe -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.3' build test`
