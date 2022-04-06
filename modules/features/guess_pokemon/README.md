## Purpose

This module contain the feature for "Who's That Pokemon?" where user has to guess the pokemon for 

## Usage
Add this module in pubspec.ymal to get all the dependencies.
```yaml
dependencies:
  guess_pokemon:
    path: modules/features/guess_pokemon
```

## Additional information

This module has it's own data and domain layer according to the feature requirements. The dependencies are exposed via GetIt. 

## Module Setup

This module exposes ```main.dart```  file that has ```setupGuessPokemonFeature``` function which is used to setup the module's dependency graph among other requirements.

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