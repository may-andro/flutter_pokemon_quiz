import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/pokemon/pokemon_repository.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import '../../../fake/repository/pokemon/fake_pokemon_repository.dart';

void main() {
  group(AddFavoritePokemonUseCase, () {
    late PokemonRepository pokemonRepository;

    late AddFavoritePokemonUseCase addFavouritePokemonUseCase;

    setUp(() {
      pokemonRepository = FakePokemonRepository();

      addFavouritePokemonUseCase = AddFavoritePokemonUseCase(pokemonRepository);
    });

    group('call', () {
      test(
          'should return ${Right<Failure, Pokemon>} when '
          '$PokemonRepository did not throw exception', () {
        final result = addFavouritePokemonUseCase(
          const Pokemon(
            index: 3,
            name: 'name3',
            baseExperience: 1,
            weight: 12,
            height: 22,
            imageUrl: 'imageUrl',
            abilities: [],
            moves: [],
            types: [],
            stats: [],
            isFavorite: false,
            isCaptured: false,
          ),
        );

        expect(result.isRight(), true);
      });

      test(
          'should return ${Left<Failure, Pokemon>} when '
          '$PokemonRepository throw exception', () {
        final result = addFavouritePokemonUseCase(
          const Pokemon(
            index: 4,
            name: 'name4',
            baseExperience: 1,
            weight: 12,
            height: 22,
            imageUrl: 'imageUrl',
            abilities: [],
            moves: [],
            types: [],
            stats: [],
            isFavorite: false,
            isCaptured: false,
          ),
        );

        expect(result.isLeft(), true);
      });
    });
  });
}
