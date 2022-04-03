import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
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
);

void main() {
  group(AddFavouritePokemonUseCase, () {
    setUpAll(() {
      registerFallbackValue(
        LocalPokemon(index: 1, name: 'name', imageUrl: 'imageUrl'),
      );
    });

    late MockedPokemonRepository mockedPokemonRepository;
    late PokemonLocalMapper pokemonLocalMapper;

    late AddFavouritePokemonUseCase addFavouritePokemonUseCase;

    setUp(() {
      mockedPokemonRepository = MockedPokemonRepository();
      pokemonLocalMapper = PokemonLocalMapper();

      addFavouritePokemonUseCase = AddFavouritePokemonUseCase(
        mockedPokemonRepository,
        pokemonLocalMapper,
      );
    });

    group('call', () {
      test(
          'should return $Right when '
          '$PokemonRepository did not throw exception', () {
        mockedPokemonRepository.mockPutFavoritePokemon();

        final result = addFavouritePokemonUseCase(_pokemon);

        expect(result.isRight(), true);
      });

      test(
          'should return $Left when '
          '$PokemonRepository throw exception', () {
        mockedPokemonRepository.mockPutFavoritePokemonThrowException();

        final result = addFavouritePokemonUseCase(_pokemon);

        expect(result.isLeft(), true);
        expect(result.asLeft(), const Failure(ERROR_DB_ID));
      });
    });
  });
}
