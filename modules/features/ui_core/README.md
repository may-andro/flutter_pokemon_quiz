## Motivation

The ideology behind this module is to combine different common aspects of presentation layer in one place.
This helps with:
- [x] Usability
- [x] Accessibility to core dependencies
- [x] Efficient Maintainability

## Purpose

This module contain the core objects required for the presentation layer in the app.
- [x] Theme
- [x] Common Widgets
- [x] Provider State Management Setup
- [x] Extensions
- [x] Routing Management

![ui_core](https://user-images.githubusercontent.com/16761273/163684416-a577efe9-eaf6-477c-8026-e9d396ee4c3a.jpg)

## Usage
Add this module in pubspec.ymal to get all the dependencies.
```yaml
dependencies:
  dependencies:
    path: modules/dependencies
```

## Module Setup

This module exposes ```main.dart```  file that has ```setupUiCoreModule``` function which is used to setup the module's dependency graph among other requirements.

## Dependencies

```yaml
dependencies:
  path: ../../dependencies
```

## Testing

- [] Widget [TODO]
- [] Provider [TODO]