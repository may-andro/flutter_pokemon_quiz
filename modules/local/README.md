## Motivation

The ideology behind this module is to separate out the local/database storage setup from main app and to keep it independent of the storage client.
This helps with:
- [x] Separation of Concern of Module
- [x] Testable Module
- [x] Efficient Maintainability
- [x] Dependency Inversion is maintained
- [x] Open Close Principle
- [x] Interface Segregation for Boxes.

## Purpose

This module is used for the setup of databases and local storage in the app.
Currently ```Object Box``` is used a local storage client. This module can be extended for other storage clients also like ```Hive```.

## Overview

This module consists of 
- [x] Local Entities: These data classes are used for the DB Tables.
- [x] Clients: Refers to different storage package which can be used for handling local storage.
- [x] Dependency Inject: GetIt is passed to module in order to set the dependency graph.
- [x] Law of Demeter: Only abstracts have been exposed out the package so that concrete implementations are hidden from client.

![local](https://user-images.githubusercontent.com/16761273/163681052-af77e9a5-a9e2-4dd9-ae8c-1da7fbd839d1.jpg)

## Usage

Add this module in pubspec.yaml to get all the dependencies.
```yaml
dependencies:
  local:
    path: ../local
```

## Setup

The module exposes ```main.dart``` with the function ```setupLocalModule``` for the module initialization.

## Unit Test

- [x] Todo