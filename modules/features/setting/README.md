## Feature

```Setting``` is feature where user can view app settings.

Feature Includes:
- [x] About
- [x] Privacy Policy
- [x] Terms and Conditions
- [x] Feedback
- [x] Github
- [x] Developer Menu

## Usage
Add this module in pubspec.ymal to get all the dependencies.
```yaml
dependencies:
  setting:
    path: modules/features/setting
```

## Feature Toggle

```Feature Toggle``` are switches which can control the visibility of a feature. This gives the power to control the local access of a feature.
This concept can further expanded by hooking the feature toggle with ```Firebase Remote Config``` and this will help to control the visibility of the feature dynamically.

## Additional information

The dependencies are inserted in the GetIt.

## Module Setup

This module exposes ```main.dart```  file that has ```setupSettingFeature``` function which is used to setup the module's dependency graph among other requirements.

## Dependencies

```yaml
dependencies:
  path: ../../dependencies
```