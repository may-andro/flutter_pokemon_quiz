import 'package:data/data.dart';
import 'package:domain/src/model/model.dart';
import 'package:local/local.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

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
  group(RemoveFavoritePokemonUseCase, () {
    setUpAll(() {
      registerFallbackValue(
        LocalPokemon(id: 1, name: 'name', imageUrl: 'imageUrl'),
      );
    });

    late MockedPokemonRepository mockedPokemonRepository;

    late RemoveFavoritePokemonUseCase removeFavouritePokemonUseCase;

    setUp(() {
      mockedPokemonRepository = MockedPokemonRepository();

      removeFavouritePokemonUseCase = RemoveFavoritePokemonUseCase(
        mockedPokemonRepository,
      );
    });

    group('call', () {
      test('should return ${Right<Failure, Pokemon>}', () {
        mockedPokemonRepository.mockPutPokemon(_pokemon.index);

        final result = removeFavouritePokemonUseCase.call(_pokemon);

        expect(result.isRight(), true);
        expect(result.asRight().isFavorite, false);
      });

      test(
          'should return ${Left<Failure, Pokemon>} when '
          '$PokemonRepository throw exception', () {
        mockedPokemonRepository.mockPutPokemonThrowException();

        final result = removeFavouritePokemonUseCase(_pokemon);

        expect(result.isLeft(), true);
        expect(result.asLeft(), const Failure(ERROR_DB_ID));
      });
    });
  });
}
