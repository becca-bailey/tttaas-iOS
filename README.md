# Becca and Tom's iOS Tic Tac Toe ![Build Status](https://travis-ci.org/beccanelson/tttaas-iOS.svg?branch=master)

This is the iOS front-end of a tic-tac-toe application built in Clojure.

## Dependencies:
+ [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12)
+ [Java](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
+ [Maven](https://maven.apache.org/)
+ [Leiningen](http://leiningen.org/)
+ [Becca and Tom's tic tac toe server](https://github.com/beccanelson/tttaas-project)

## Project Setup:

+ Clone the [tic tac toe server](https://github.com/beccanelson/tttaas-project) and follow setup instructions

+ Clone this repository in another folder

+ Inside the root directory of this project: `pod install`

## To Play:

+ Navigate to the server, and run using `./server` (Maven must be installed)

+ Open `tttaas-iOS/iOS-tic-tac-toe.xcworkspace` in Xcode.

+ Inside Xcode, you can build the project using the build button in the upper left corner.

+ With the server running, play the game using the iOS simulator.

**Alternately, to build and test the project in the command line:**

```
xcodebuild -workspace iOS-tic-tac-toe.xcworkspace -scheme iOS-tic-tac-toe -sdk iphonesimulator build test
```
