# pokemon_quiz

Are you the Ultimate Pokemon Master???

Check it out. And finish your pokedex.

Gotta Catch ém All!!!!!!

## Dependencies

```yaml
dependencies:
  dependencies:
    path: modules/dependencies
  domain:
    path: modules/domain
  flutter:
    sdk: flutter
  pokedex:
    path: modules/features/pokedex
  guess_pokemon:
    path: modules/features/guess_pokemon
  pokemon_detail:
    path: modules/features/pokemon_detail
  setting:
    path: modules/features/setting
  ui_core:
    path: modules/features/ui_core
```

## Common difficulties in Module Arch

- [x] Navigation Between Modules [DONE]
- [x] Dependency Injection [DONE]
- [x] Circular Dependency [DONE]
- [x] Dependency Version Management [DONE]
- [ ] Localization [TODO]

## TODO
- [ ] Error Handling [TODO]
- [ ] Golden Test [TODO]
- [ ] Integration Test [TODO]

## App Arch.

This application follows the modular architecture. The app responsibilities are distributed in various modules to make it more maintainable across teams.

![app_arch (1)](https://user-images.githubusercontent.com/16761273/163763273-6900bdae-131a-48bc-9885-102fbf04852f.jpg)

Architecture tries to maintain SOLID principles in each module to enhance the testability of the app. 

## Dependency Graph

![dependecy_graph](https://user-images.githubusercontent.com/16761273/163763548-8ee7f798-d561-4a8c-93bb-9542d8a60f3e.jpg)

Very often in modular arch the most common issue is circular dependency. In order to avoid that a linear dependency approach is used in this project.

[TODO] Another way to architect this app using Uncle Bob Clean Arch would be this:

![other_app_arch](https://user-images.githubusercontent.com/16761273/163764332-5e6adefc-45d5-4db9-ab83-f8521a75a1f2.jpg)

## Data Modules

- [x] [Local Module](https://github.com/may-andro/flutter_pokemon_quiz/blob/master/modules/local/README.md)
- [x] [Network Module](https://github.com/may-andro/flutter_pokemon_quiz/blob/master/modules/network/README.md)
- [x] [Data Module](https://github.com/may-andro/flutter_pokemon_quiz/blob/master/modules/data/README.md)


## Domain Module

- [x] [Domain Module](https://github.com/may-andro/flutter_pokemon_quiz/blob/master/modules/domain/README.md)

## Feature Module

- [x] [Guess Pokemon?](https://github.com/may-andro/flutter_pokemon_quiz/blob/master/modules/features/guess_pokemon/README.md)
- [x] [Pokedex](https://github.com/may-andro/flutter_pokemon_quiz/blob/master/modules/features/pokedex/README.md)
- [x] [Pokemon Detail](https://github.com/may-andro/flutter_pokemon_quiz/blob/master/modules/features/pokemon_detail/README.md)
- [x] [Setting](https://github.com/may-andro/flutter_pokemon_quiz/blob/master/modules/features/setting/README.md)

## App Flavour

- [x] ```Kanto```
- [x] ```Johto```


## Derry Script

Derry defines the basic scripts required during development.
- [x] test: Run all test cases.
- [x] run_jhoto: Run the Jhoto flavor.
- [x] run_kanto: Run the Kanto flavor.
- [x] get_all: Run ```flutter pub get``` in each module
- [x] build_runner: Run ```flutter pub run build_runner build --delete-conflicting-outputs``` in each module

## App Screen Shots

<img width="418" alt="Screenshot 2022-04-04 at 02 15 24" src="https://user-images.githubusercontent.com/16761273/161986618-80f88855-b8f8-4158-8752-315a64e0f5dc.png">

<img width="417" alt="Screenshot 2022-04-04 at 02 15 40" src="https://user-images.githubusercontent.com/16761273/161986631-5db4d74d-c516-443a-9371-fd0ca93b1fa1.png">

<img width="414" alt="Screenshot 2022-04-04 at 02 16 04" src="https://user-images.githubusercontent.com/16761273/161986639-072f80e3-c8db-410a-8d0a-aa98c346f843.png">

<img width="416" alt="Screenshot 2022-04-04 at 02 16 40" src="https://user-images.githubusercontent.com/16761273/161986641-50a63302-fe2e-4eaa-a46b-0c7e0107863a.png">

<img width="416" alt="Screenshot 2022-04-04 at 02 16 49" src="https://user-images.githubusercontent.com/16761273/161986647-2ef3fd8e-806f-45d7-a24c-d2fe8e713069.png">

<img width="416" alt="Screenshot 2022-04-04 at 10 36 08" src="https://user-images.githubusercontent.com/16761273/161986651-867b853e-4502-46d2-a239-9d1901145319.png">

<img width="418" alt="Screenshot 2022-04-04 at 10 36 28" src="https://user-images.githubusercontent.com/16761273/161986653-858ff428-ab9a-4631-9f3f-949ae803434f.png">

<img width="419" alt="Screenshot 2022-04-04 at 10 37 50" src="https://user-images.githubusercontent.com/16761273/161986654-7bf74dcd-6221-459f-bddc-ca065cfb1653.png">

<img width="417" alt="Screenshot 2022-04-04 at 10 38 12" src="https://user-images.githubusercontent.com/16761273/161986657-40d2d4ab-bf61-44fb-875b-2e10b9206584.png">

## App Video

https://user-images.githubusercontent.com/16761273/161990198-ddea9726-03e9-432b-8a46-08b8b4ddb0a1.mov

https://user-images.githubusercontent.com/16761273/161990224-9c1c4b63-a9ff-4d7e-925f-cf99200f8d11.mov
