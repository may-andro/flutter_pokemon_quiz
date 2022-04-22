## Feature

```Guess Pokemon?``` is feature where user can interact the with the microphone to guess the pokemon name. 
On correct answer the image comes to light. On each successful answer the pokemon is captured and visible in the ```Pokedex``` feature.

If the ```Feature Toggle``` is on for the ```Pokemon Detail``` feature then on click of pokemon takes user to detail page.

Feature Includes:
- [x] Fetching pokemon from server
- [x] Speech to Text 
- [x] Fetch next pokemon
- [x] View pokemon without answer
- [x] Pokemon Detail if the ```Feature.pokemon_detail``` is on
- [x] Capture pokemon for pokedex entries

## State Management

Provider state management is used. View Model is used as state manager object for UI. This is provided to different widget via Provider Package.

## Arch Overview

![guess_pokemon](https://user-images.githubusercontent.com/16761273/163689635-590e0e66-9a29-4eee-b869-36fda4743157.jpg)

## Screen Shot

https://user-images.githubusercontent.com/16761273/163689357-29d06c0f-7718-41c2-9707-f5415d79e686.mov

<img width="405" alt="Screenshot 2022-04-16 at 21 44 52" src="https://user-images.githubusercontent.com/16761273/163689362-e8f15a98-b2f1-43fd-b2b0-3b43fb9cda68.png">

<img width="402" alt="Screenshot 2022-04-16 at 21 45 02" src="https://user-images.githubusercontent.com/16761273/163689363-83a8ae83-3f98-458d-9d86-4aa04116ceec.png">

<img width="398" alt="Screenshot 2022-04-16 at 21 45 27" src="https://user-images.githubusercontent.com/16761273/163689364-2b3f96a5-a674-444c-ab2b-cab2479908a8.png">

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

## Unit Testing

- [x] Unit Test
- [ ] Golden Test
- [ ] Integration Test
