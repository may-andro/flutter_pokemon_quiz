import 'package:data/data.dart';
import 'package:domain/src/model/error/extension/failure_extension.dart';
import 'package:domain/src/model/error/failure.dart';
import 'package:domain/src/model/error/ids/common_order_ids.dart';
import 'package:domain/src/model/pokemon/pokemon.dart';
import 'package:domain/src/usecase/pokemon/capture_pokemon_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local/local.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

import '../../mock/repository/pokemon/mocked_pokemon_repository.dart';

const _pokemon = Pokemon(
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

void main() {
  group(CapturePokemonUseCase, () {
    setUpAll(() {
      registerFallbackValue(
        LocalPokemon(
            id: 1, name: 'name', imageUrl: 'imageUrl', isCaptured: true),
      );
    });

    late MockedPokemonRepository mockedPokemonRepository;

    late CapturePokemonUseCase capturePokemonUseCase;

    setUp(() {
      mockedPokemonRepository = MockedPokemonRepository();

      capturePokemonUseCase = CapturePokemonUseCase(mockedPokemonRepository);
    });

    group('call', () {
      test('should return ${Right<Failure, Pokemon>}', () {
        mockedPokemonRepository.mockPutPokemon(_pokemon.index);

        final result = capturePokemonUseCase(_pokemon);

        expect(result.isRight(), isTrue);
        expect(result.asRight().isCaptured, isTrue);
        verify(
          () => mockedPokemonRepository.putPokemon(any()),
        ).called(1);
      });

      test(
          'should return ${Left<Failure, Pokemon>} '
          'when $PokemonRepository throw $Exception', () {
        mockedPokemonRepository.mockPutPokemonThrowException();

        final result = capturePokemonUseCase.call(_pokemon);

        expect(result.isLeft(), isTrue);
        expect(result.asLeft(), const Failure(ERROR_DB_ID));
      });
    });
  });
}
