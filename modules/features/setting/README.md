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

Feature Toggles:
- [x] ```Feature.developer_mode```: Controls the visibility of ```Developer Menu``` menu item in ```Setting``` Feature
- [x] ```Feature.pokedex```: Controls the visibility of ```Pokedex``` Feature in App
- [x] ```Feature.pokemon_detail```: Controls the visibility of ```Pokemon Detail``` Feature in App
- [x] ```Feature.user_feedback```: Controls the visibility of ```Feedback``` menu item in ```Setting``` Feature

![feature_toggle](https://user-images.githubusercontent.com/16761273/163729032-753d8e27-db73-4982-b2cc-894f7d4affad.jpg)

## Additional information

The dependencies are inserted in the GetIt.

## Module Setup

This module exposes ```main.dart```  file that has ```setupSettingFeature``` function which is used to setup the module's dependency graph among other requirements.

## Dependencies

```yaml
dependencies:
  path: ../../dependencies
```