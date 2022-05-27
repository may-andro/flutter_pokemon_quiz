import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/pokemon/pokemon_repository.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fake/repository/pokemon/fake_pokemon_repository.dart';

void main() {
  group(IsCapturedPokemonUseCase, () {
    late PokemonRepository pokemonRepository;

    late IsCapturedPokemonUseCase isCapturedPokemonUseCase;

    setUp(() {
      pokemonRepository = FakePokemonRepository();

      isCapturedPokemonUseCase = IsCapturedPokemonUseCase(pokemonRepository);
    });

    group('call', () {
      test('should return true when pokemon isCaptured', () {
        pokemonRepository.addToCaptured(
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

        final result = isCapturedPokemonUseCase(1);

        expect(result, isTrue);
      });

      test('should return false when pokemon is not isCaptured', () {
        final result = isCapturedPokemonUseCase(1);

        expect(result, isFalse);
      });
    });
  });
}
