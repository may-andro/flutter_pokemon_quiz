## Motivation

The ideology behind this module is to separate out the remote/network setup from main app and to keep it independent of the network client.
This helps with:
- [x] Separation of Concern of Module
- [x] Testable Module
- [x] Efficient Maintainability
- [x] Dependency Inversion is maintained
- [x] Open Close Principle
- [x] Interface Segregation among different clients.

## Purpose

This module is used for the setup of remote clients required in the app. 
Currently there are three clients: ```Dio```, ```Firestore```, ```Remote Config```

## Overview

This module consists of
- [x] Remote Entities: These data classes are used for the Networking.
- [x] Clients: Refers to different networking package which can be used for handling local storage.
- [x] Dependency Inject: GetIt is passed to module in order to set the dependency graph.
- [x] Law of Demeter: Only abstracts have been exposed out the package so that concrete implementations are hidden from client.

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

- [x] Unit Tests has been added for the module.