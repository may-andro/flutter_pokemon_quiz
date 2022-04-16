import 'package:domain/src/usecase/pokemon/is_favorite_pokemon_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/repository/pokemon/mocked_pokemon_repository.dart';

void main() {
  group(IsFavoritePokemonUseCase, () {
    late MockedPokemonRepository mockedPokemonRepository;

    late IsFavoritePokemonUseCase isFavoritePokemonUseCase;

    setUp(() {
      mockedPokemonRepository = MockedPokemonRepository();

      isFavoritePokemonUseCase = IsFavoritePokemonUseCase(
        mockedPokemonRepository,
      );
    });

    group('call', () {
      test('should return true when pokemon isCaptured', () {
        mockedPokemonRepository.mockQueryIsFavoritePokemon(true);

        final result = isFavoritePokemonUseCase(1);

        expect(result, isTrue);
        verify(() => mockedPokemonRepository.queryIsFavoritePokemon(any()));
      });

      test('should return false when pokemon is not isCaptured', () {
        mockedPokemonRepository.mockQueryIsFavoritePokemon(false);

        final result = isFavoritePokemonUseCase(1);

        expect(result, isFalse);
        verify(() => mockedPokemonRepository.queryIsFavoritePokemon(any()));
      });
    });
  });
}
