## Motivation

The ideology behind this module is to combine different data source, combine the raw data, and expose it out to client via repositories.
This helps with:
- [x] Separation of Concern of Data Storage handling
- [x] Testable Module
- [x] Efficient Maintainability
- [x] Dependency Inversion is maintained
- [x] Open Close Principle
- [x] Interface Segregation for features.

## Purpose

This modules assemble and expose the set of data in form of repositories.

## Overview

This module consists of
- [x] Data Sources: Combines different source for a feature, hides data handling decisions, exposes the abstractions to repositories. Refer to ```PokemonDataSourceImpl```.
- [x] Exceptions: Exposes set of command exceptions to clients which can be handled in presentation layer.
- [x] Dependency Inject: GetIt is passed to module in order to set the dependency graph.
- [x] Law of Demeter: Only abstracts have been exposed out the package so that concrete implementations are hidden from client.

![data](https://user-images.githubusercontent.com/16761273/163682420-e795a712-045b-4a43-a13f-688e39ea5f90.jpg)

## Setup

The module exposes the ```main.dart``` with a function ```setUpDataModule``` for initializing the module.

## Usage

```yaml
dependencies:
  data:
    path: ../data
```

## Dependencies

This module depends on the ```Local``` & ```Network``` Modules.
```yaml
dependencies:
  dependencies:
    path: ../dependencies
  local:
    path: ../local
  network:
    path: ../network
```

## Unit Test

- [x] Data Sources
- [x] Repositories