import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/pokemon/pokemon_repository.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import '../../../fake/repository/pokemon/fake_pokemon_repository.dart';

void main() {
  group(CapturePokemonUseCase, () {
    late PokemonRepository pokemonRepository;

    late CapturePokemonUseCase capturePokemonUseCase;

    setUp(() {
      pokemonRepository = FakePokemonRepository();

      capturePokemonUseCase = CapturePokemonUseCase(pokemonRepository);
    });

    group('call', () {
      test('should return ${Right<Failure, Pokemon>}', () {
        final result = capturePokemonUseCase(
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

        expect(result.isRight(), isTrue);
        expect(pokemonRepository.isCapturedPokemon(3), isTrue);
      });

      test(
          'should return ${Left<Failure, Pokemon>} '
          'when $PokemonRepository throw $Exception', () {
        final result = capturePokemonUseCase.call(
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

        expect(result.isLeft(), isTrue);
      });
    });
  });
}
