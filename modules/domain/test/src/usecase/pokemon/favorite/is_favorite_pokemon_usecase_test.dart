import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/pokemon/pokemon_repository.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fake/repository/pokemon/fake_pokemon_repository.dart';

void main() {
  group(IsFavoritePokemonUseCase, () {
    late PokemonRepository pokemonRepository;

    late IsFavoritePokemonUseCase isFavoritePokemonUseCase;

    setUp(() {
      pokemonRepository = FakePokemonRepository();

      isFavoritePokemonUseCase = IsFavoritePokemonUseCase(pokemonRepository);
    });

    group('call', () {
      test('should return true when pokemon isCaptured', () {
        pokemonRepository.addToFavorites(
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

        final result = isFavoritePokemonUseCase(1);

        expect(result, isTrue);
      });

      test('should return false when pokemon is not isCaptured', () {
        final result = isFavoritePokemonUseCase(1);

        expect(result, isFalse);
      });
    });
  });
}
