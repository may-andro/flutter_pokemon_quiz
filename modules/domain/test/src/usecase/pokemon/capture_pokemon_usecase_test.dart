import 'package:domain/src/model/error/extension/failure_extension.dart';
import 'package:domain/src/model/error/failure.dart';
import 'package:domain/src/model/error/ids/common_order_ids.dart';
import 'package:domain/src/model/pokemon/pokemon.dart';
import 'package:domain/src/usecase/pokemon/capture_pokemon_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local/local.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/repository/pokemon/mocked_pokemon_repository.dart';

void main() {
  group(CapturePokemonUseCase, () {
    setUpAll(() {
      registerFallbackValue(
        LocalPokemon(
          index: 1,
          name: 'name',
          imageUrl: 'imageUrl',
          isCaptured: true,
        ),
      );
    });

    late MockedPokemonRepository mockedPokemonRepository;

    late CapturePokemonUseCase capturePokemonUseCase;

    setUp(() {
      mockedPokemonRepository = MockedPokemonRepository();

      capturePokemonUseCase = CapturePokemonUseCase(mockedPokemonRepository);
    });

    group('call', () {
      test('should save $LocalPokemon', () {
        const pokemon = Pokemon(
          index: 1,
          name: 'name',
          baseExperience: 1,
          weight: 1,
          height: 1,
          imageUrl: 'imageUrl',
          abilities: [],
          moves: [],
          types: [],
          stats: [],
          isFavorite: false,
          isCaptured: false,
        );
        final localPokemon = LocalPokemon(
          index: 1,
          name: 'name',
          imageUrl: 'imageUrl',
          isCaptured: true,
        );
        mockedPokemonRepository.mockPutPokemon(localPokemon);

        final result = capturePokemonUseCase(pokemon);

        expect(result.isRight(), true);
        verify(
          () => mockedPokemonRepository.putPokemon(any()),
        ).called(1);
      });

      test('should throw $Exception', () {
        const pokemon = Pokemon(
          index: 1,
          name: 'name',
          baseExperience: 1,
          weight: 1,
          height: 1,
          imageUrl: 'imageUrl',
          abilities: [],
          moves: [],
          types: [],
          stats: [],
          isFavorite: false,
          isCaptured: false,
        );
        mockedPokemonRepository.mockPutPokemonThrowException();

        final result = capturePokemonUseCase.call(pokemon);

        expect(result.isLeft(), true);
        expect(result.asLeft(), const Failure(ERROR_DB_ID));
      });
    });
  });
}
