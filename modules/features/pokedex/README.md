## Feature

```Pokedex``` is feature where user can see all it's captured and favorite pokemons.
Visibility of this feature is decided via ```Feature.pokedex```. 

Feature Includes:
- [x] Fetching pokedex from server
- [x] Show captured pokemons
- [x] Show favorite pokemons
- [x] Blackout un captured pokemons

## State Management

Provider state management is used. View Model is used as state manager object for Presentation Layer. This is provided to different widget via Provider Package.

## Arch Overview

![pokedex](https://user-images.githubusercontent.com/16761273/163719711-e098a7b5-b159-45dd-bcc5-2a08e681b8b1.jpg)

## Screen Shot

<img width="454" alt="Screenshot 2022-04-17 at 16 51 07" src="https://user-images.githubusercontent.com/16761273/163719852-a8105fa0-cbb9-4ba3-a458-278c1634bb81.png">

## Usage
Add this module in pubspec.ymal to get all the dependencies.
```yaml
dependencies:
  pokedex:
    path: modules/features/pokedex
```

## Additional information

This module does not have it's own domain and data, it takes business logic from central ```domain``` module. The dependencies are inserted in the GetIt.

## Module Setup

This module exposes ```main.dart```  file that has ```setupPokedexFeature``` function which is used to setup the module's dependency graph among other requirements.

## Dependencies

```yaml
ui_core:
  path: ../../features/ui_core
dependencies:
  path: ../../dependencies
domain:
  path: ../../domain
```

## Unit Testing

- [x] Unit Test
- [ ] Golden Test
- [ ] Integration Test
