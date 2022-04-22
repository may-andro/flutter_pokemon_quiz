## Feature

```Pokemon Detail``` is feature where user can view pokemon statistics.
The visibility of this feature is controlled by ```Feature.pokemon_detail``` feature toggle and remote config.

Feature Includes:
- [x] Pokemon Stats
- [x] Pokemon Moves
- [x] Mark pokemon as Favorite

## State Management

Provider state management is used. View Model is used as state manager object for UI. This is provided to different widget via Provider Package.

## Arch Overview

![pokemon_detail](https://user-images.githubusercontent.com/16761273/163721342-6f48171b-ab66-4401-bc8a-64c4b7727307.jpg)

## Screen Shot

![ezgif com-gif-maker](https://user-images.githubusercontent.com/16761273/163721522-001e5b35-cbb3-4769-9714-5f4815a9bb3d.gif)

<img width="454" alt="Screenshot 2022-04-17 at 17 30 14" src="https://user-images.githubusercontent.com/16761273/163721433-153811b0-e5fe-4cb4-a6be-c996ed101c18.png">

<img width="452" alt="Screenshot 2022-04-17 at 17 30 22" src="https://user-images.githubusercontent.com/16761273/163721434-18362ab9-759f-4b81-af4c-2cdbc8dde335.png">

<img width="449" alt="Screenshot 2022-04-17 at 17 30 39" src="https://user-images.githubusercontent.com/16761273/163721436-87895f0d-ab6a-405a-b452-60d12b8fc0af.png">

<img width="453" alt="Screenshot 2022-04-17 at 17 30 54" src="https://user-images.githubusercontent.com/16761273/163721437-50e199dc-336e-4c5a-934b-45983e0fe25d.png">

## Usage
Add this module in pubspec.ymal to get all the dependencies.
```yaml
dependencies:
  pokemon_detail:
    path: modules/features/pokemon_detail
```

## Additional information

The dependencies are inserted in the GetIt.

## Module Setup

This module exposes ```main.dart```  file that has ```setupPokemonDetailFeature``` function which is used to setup the module's dependency graph among other requirements.

## Dependencies

```yaml
ui_core:
  path: ../../features/ui_core
dependencies:
  path: ../../dependencies
domain:
  path: ../../domain
```

## Testing

- [x] Unit Test
- [ ] Golden Test
- [ ] Integration Test