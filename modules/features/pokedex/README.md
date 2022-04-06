## Purpose

This module contain the feature of "Pokedex" where user checkout his captured pokemons.

## Usage
Add this module in pubspec.ymal to get all the dependencies.
```yaml
dependencies:
  pokedex:
    path: modules/features/pokedex
```

## Additional information

This  module has it's domain layer for the UI need. The dependencies are inserted in the GetIt.

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

## Screen Shots

## Testing

TODO