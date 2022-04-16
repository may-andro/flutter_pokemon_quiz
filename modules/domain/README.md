## Motivation

The ideology behind this module is to separate out common business logic from the data and presentation layer.
This helps with:
- [x] Separation of Concern of Module
- [x] Testable Module
- [x] Efficient Maintainability
- [x] Dependency Inversion is maintained
- [x] Open Close Principle
- [x] Interface Segregation for various business logic.

## Purpose

This module has all the basic business domain logic required of the app. It exposes usecases for the app.

## Getting started

The module exposed ```main.dart``` which has a function ```setupDomainModule``` which can be used for setup of this module.


## Overview

This module consists of
- [x] Business Model: These data classes are used for the business concepts.
- [x] Usecase: Handles a single business requirement for a requirement.
- [x] Dependency Inject: GetIt is passed to module in order to set the dependency graph.
- [x] Mappers: Handles the ,mapping between data and domain models.  
- [x] Law of Demeter: Only abstracts have been exposed out the package so that concrete implementations are hidden from client.

![domain](https://user-images.githubusercontent.com/16761273/163683083-9334e598-b434-44e7-ac4f-558e9cc1150d.jpg)

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

## Usecases

- [x] ```DisableFeatureToggleUseCase```
- [x] ```EnableFeatureToggleUseCase```
- [x] ```FetchFeatureConfigsUseCase```
- [x] ```IsFeatureEnabledUseCase```

- [x] ```FetchPokedexEndIndexUseCase```
- [x] ```FetchPokedexStartIndexUseCase```
- [x] ```FetchPokedexUseCase```

- [x] ```AddFavoritePokemonUseCase```
- [x] ```FetchFavoritePokemonsUseCase```
- [x] ```IsFavoritePokemonUseCase```
- [x] ```RemoveFavoritePokemonUseCase```

- [x] ```CapturePokemonUseCase```
- [x] ```FetchCapturedPokemonsUseCase```
- [x] ```IsCapturedPokemonUseCase```
  
- [x] ```FetchPokemonUseCase```

## Testing

- [x] Mappers
- [x] Usecase

## FAQ

### Mappers??
Mappers are required to seperate out the dependecy of business logic with raw storage entities. In software development it is very often that an api reponse might change with time. Keeping a separation between these data models enhances the maintainability of code in long run.

### Usecase??
Usecase follows the single responsibility principle where it handles only one business requirement. Usecase can be used by another user case to handle complex business requirement.

### What if I need to do some initialization setup??
All initialization related setup is handled in the ```main.dart``` file.

### Does all feature usecase resides in domain??
Not really, one can keep only globally used usecases in domain and other business requirement could be part of individual features.