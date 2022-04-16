import 'package:domain/src/usecase/pokemon/is_captured_pokemon_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/repository/pokemon/mocked_pokemon_repository.dart';

void main() {
  group(IsCapturedPokemonUseCase, () {
    late MockedPokemonRepository mockedPokemonRepository;

    late IsCapturedPokemonUseCase isCapturedPokemonUseCase;

    setUp(() {
      mockedPokemonRepository = MockedPokemonRepository();

      isCapturedPokemonUseCase = IsCapturedPokemonUseCase(
        mockedPokemonRepository,
      );
    });

    group('call', () {
      test('should return true when pokemon isCaptured', () {
        mockedPokemonRepository.mockQueryIsCapturedPokemon(true);

        final result = isCapturedPokemonUseCase(1);

        expect(result, isTrue);
        verify(() => mockedPokemonRepository.queryIsCapturedPokemon(any()));
      });

      test('should return false when pokemon is not isCaptured', () {
        mockedPokemonRepository.mockQueryIsCapturedPokemon(false);

        final result = isCapturedPokemonUseCase(1);

        expect(result, isFalse);
        verify(() => mockedPokemonRepository.queryIsCapturedPokemon(any()));
      });
    });
  });
}
