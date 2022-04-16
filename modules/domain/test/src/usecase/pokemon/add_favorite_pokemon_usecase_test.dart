import 'package:data/data.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:local/local.dart';

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
  group(AddFavoritePokemonUseCase, () {
    setUpAll(() {
      registerFallbackValue(
        LocalPokemon(id: 1, name: 'name', imageUrl: 'imageUrl'),
      );
    });

    late MockedPokemonRepository mockedPokemonRepository;

    late AddFavoritePokemonUseCase addFavouritePokemonUseCase;

    setUp(() {
      mockedPokemonRepository = MockedPokemonRepository();

      addFavouritePokemonUseCase = AddFavoritePokemonUseCase(
        mockedPokemonRepository,
      );
    });

    group('call', () {
      test(
          'should return ${Right<Failure, Pokemon>} when '
          '$PokemonRepository did not throw exception', () {
        mockedPokemonRepository.mockPutPokemon(_pokemon.index);

        final result = addFavouritePokemonUseCase(_pokemon);

        expect(result.isRight(), true);
      });

      test(
          'should return ${Left<Failure, Pokemon>} when '
          '$PokemonRepository throw exception', () {
        mockedPokemonRepository.mockPutPokemonThrowException();

        final result = addFavouritePokemonUseCase(_pokemon);

        expect(result.isLeft(), true);
        expect(result.asLeft(), const Failure(ERROR_DB_ID));
      });
    });
  });
}
