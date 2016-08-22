# Becca and Tom's iOS Tic Tac Toe [![Build Status](https://travis-ci.org/beccanelson/tttaas-iOS.svg?branch=master)](https://travis-ci.org/beccanelson/tttaas-iOS)
This is the iOS front-end of a tic-tac-toe application built in Clojure.

## Dependencies:
+ [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12)
+ [Tic-Tac-Toe API](https://www.github.com/beccanelson/tttaas-project) (to run server locally) 

## Project Setup:

+ Clone this repository

+ If you want to use Local-iOS-tic-tac-toe scheme follow instructions at [Tic-Tac-Toe API](https://www.github.com/beccanelson/tttaas-project).

## To Play:

+ Open `tttaas-iOS/iOS-tic-tac-toe.xcworkspace` in Xcode.

![Scheme Selection](http://www.tomcmcgee.me/assets/images/selectScheme.png)

+ If you want to hit the deployed API select the Scheme `Production-iOS-tic-tac-toe`

+ If you have the api running locally at `http://localhost:5000/game` select `Local-iOS-tic-tac-toe`

+ Inside Xcode, you can build the project in the simulator or a device using the build button in the upper left corner.

## To Test: 

+ Open `tttaas-iOS/iOS-tic-tac-toe.xcworkspace` in Xcode.

+ If you want to run the tests you **must** be in the `Local-iOS-tic-tac-toe` scheme!

+ `Cmd + U` to run all tests in xCode

**Alternately, to build and test the project in the command line:**

`xcodebuild -workspace iOS-tic-tac-toe.xcworkspace -scheme Local-iOS-tic-tac-toe -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.3' build test`
