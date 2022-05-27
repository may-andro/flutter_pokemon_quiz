import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/pokemon/pokemon_repository.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import '../../../fake/repository/pokemon/fake_pokemon_repository.dart';

void main() {
  group(RemoveFavoritePokemonUseCase, () {
    late PokemonRepository pokemonRepository;

    late RemoveFavoritePokemonUseCase removeFavouritePokemonUseCase;

    setUp(() {
      pokemonRepository = FakePokemonRepository();

      removeFavouritePokemonUseCase = RemoveFavoritePokemonUseCase(
        pokemonRepository,
      );
    });

    group('call', () {
      test('should return ${Right<Failure, Pokemon>}', () {
        final result = removeFavouritePokemonUseCase.call(
          const Pokemon(
            index: 1,
            name: 'name1',
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
        expect(pokemonRepository.isCapturedPokemon(1), false);
      });

      test(
          'should return ${Left<Failure, Pokemon>} when '
          '$PokemonRepository throw exception', () {
        final result = removeFavouritePokemonUseCase(
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
