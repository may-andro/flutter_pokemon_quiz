## Purpose

This module is used for the setup of remote clients required in the app. 
Currently there are three clients: ```Dio```, ```Firestore```, ```Remote Config```

Here is an overview of this module:

![netwotk](https://user-images.githubusercontent.com/16761273/163680181-f66da514-0bd3-4463-a907-7f05bd14431b.jpg)

## Usage

Add this module in pubspec.ymal to get all the dependencies.
```yaml
dependencies:
  network:
    path: ../network
```

## Setup

The module exposes ```main.dart``` with the function ```setUpNetworkModule``` for the module initialization. This method handles the dependency injection and requirements for this module to be fully functional.

## Unit Test

[x] Unit Tests has been added for the module.