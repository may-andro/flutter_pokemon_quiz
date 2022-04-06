## Purpose

This module has all the basic business domain logic required of the app. It exposes usecases for the app.

## Getting started

The module exposed ```main.dart``` which has a function ```setupDomainModule``` which can be used for setup of this module.

## Usage

```yaml
dependencies:
  domain:
    path: ../domain
```

## Dependencies

```yaml
dependencies:
  data:
    path: ../data
```

This module depends on the data module for the data fetch.

## Testing

TODO