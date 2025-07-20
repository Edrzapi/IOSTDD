# IOSTDD 📱

A simple teaching app built with SwiftUI, designed for Test-Driven Development (TDD) practice. This project mirrors the Android version and helps iOS developers explore key concepts in unit testing, UI testing, and clean architecture.

---

## Table of Contents

- [Prerequisites](#prerequisites)  
- [Setup Environment](#setup-environment)  
- [Getting Started](#getting-started)  
- [Building and Running from the Command Line](#building-and-running-from-the-command-line)  
- [Running Tests](#running-tests)  
- [Resources](#resources)  
- [Purpose](#purpose)  

---

## Prerequisites

- **Language**: Swift 6+  
- **UI Framework**: SwiftUI  
- **Architecture**: MVVM  
- **Testing**: XCTest, XCUITest  
- **Xcode**: 15.0 or later  
- **Minimum iOS Version**: iOS 17.0  

---

## Setup Environment

We use Swift Package Manager for dependency management—no extra scripts needed. Simply open the project and Xcode will resolve any packages.

---

## Getting Started

```bash
git clone https://github.com/Edrzapi/IOSTDD.git
cd IOSTDD
open IOSTDD.xcodeproj
```

1. In Xcode, select a simulator (e.g. iPhone 15) and press **Run** (or **⌘R**) to build and launch the app.

---

## Building and Running from the Command Line

### Build the App

```bash
xcodebuild build   -project IOSTDD.xcodeproj   -scheme IOSTDD   -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest'
```

### Run the App on Simulator After Resetting

Here is an example of how you can reset the simulator, build the app, and launch it directly from the command line:

```bash
# Reset all simulators to a clean state
xcrun simctl erase all

# Boot the desired simulator
xcrun simctl boot "iPhone 15"

# Build the app for the simulator
xcodebuild build   -project IOSTDD.xcodeproj   -scheme IOSTDD   -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest'

# Install the built app onto the booted simulator
xcrun simctl install booted ./Build/Products/Debug-iphonesimulator/IOSTDD.app

# Launch the app
xcrun simctl launch booted com.yourcompany.IOSTDD
```

> Replace `com.yourcompany.IOSTDD` with your app’s actual bundle identifier.

---

## Running Tests

### Unit Tests

Unit tests live under the **IOSTDDTests** target.

- **In Xcode**  
  Select the **IOSTDD** scheme, then **Product > Test** (⌘U).

- **From the command line**  
  ```bash
  xcodebuild test     -project IOSTDD.xcodeproj     -scheme IOSTDD     -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest'
  ```

### UI Tests

UI tests live under the **IOSTDDUITests** target.

- **In Xcode**  
  Select the **IOSTDDUITests** scheme, then press **⌘U**.

- **From the command line**  

Here is an example of how you can reset the simulator and run your UI tests from the command line:

```bash
# (Optionally reset simulator)
xcrun simctl erase all

# Run UI Tests
xcodebuild test   -project IOSTDD.xcodeproj   -scheme IOSTDDUITests   -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest'
```

---

## Resources

- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)  
- [XCTest Overview](https://developer.apple.com/documentation/xctest)  
- [XCUITest Guide](https://developer.apple.com/documentation/xctest/user_interface_tests)  

---

## Purpose

IOSTDD is designed to accompany tutorials and learning sessions on iOS development, clean architecture, and test-driven practices. It mirrors the Android version feature-for-feature, providing a consistent cross-platform teaching experience.
