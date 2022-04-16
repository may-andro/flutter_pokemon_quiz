## Motivation

One of the issues of modularization is scattered dependency across the modules. Maintaining such dependencies overtime becomes tedious task and not to mention error prone.
To solve this issue we have a dependency module which acts a central repository of dependencies for the whole project. 

This helps with:
- [x] Efficient Maintainability

## Features

This module is used for maintaining dependencies. 

## Getting started

Please refer the pubspecs.yaml file.

## Usage
```yaml
dependencies:
  local:
    path: ../dependencies
```

## FAQ

### Do I have to define dependecy here if I need it only in one specific modules??
Not really, if the dependency scope is limited to one module, one can define and use it in local pubspecs.yaml file of module.

### What about the dev dependencies??
Sadly dev dependencies has to be maintained in each module's pubspecs.yaml file for now.