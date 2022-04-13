import 'package:data/src/data_source/pokemon/pokemon_data_source.dart';
import 'package:data/src/repository/pokemon/pokemon_repository.dart';
import 'package:data/src/repository/pokemon/pokemon_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local/local.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

import '../../data_source/pokemon/mocked_pokemon_data_source.dart';

void main() {
  group(PokemonRepositoryImpl, () {
    late MockedPokemonDataSource mockedPokemonDataSource;

    late PokemonRepository pokemonRepository;

    setUp(() {
      mockedPokemonDataSource = MockedPokemonDataSource();

      pokemonRepository = PokemonRepositoryImpl(mockedPokemonDataSource);
    });

    group('putFavoritePokemon', () {
      test('should call $PokemonDataSource', () {
        final localPokemon = LocalPokemon(
          index: 1,
          name: 'name',
          imageUrl: 'imageUrl',
        );

        pokemonRepository.putPokemon(localPokemon);

        verify(() => mockedPokemonDataSource.putPokemon(localPokemon))
            .called(1);
      });
    });

    group('removeFavoritePokemon', () {
      test('should call $PokemonDataSource', () {
        pokemonRepository.removePokemon(1);

        verify(() => mockedPokemonDataSource.removePokemon(1)).called(1);
      });
    });

    group('getAllFavorites', () {
      test('should return $LocalPokemon list ', () {
        mockedPokemonDataSource.mockGetPokemons([]);

        final result = pokemonRepository.getPokemons();

        verify(() => mockedPokemonDataSource.getPokemons()).called(1);
        expect(result, []);
      });

      test('should return non nullable $LocalPokemon list ', () {
        mockedPokemonDataSource.mockGetPokemons([
          LocalPokemon(
            index: 1,
            name: 'name',
            imageUrl: 'imageUrl',
          ),
          null,
          LocalPokemon(
            index: 2,
            name: 'name',
            imageUrl: 'imageUrl',
          ),
        ]);

        final result = pokemonRepository.getPokemons();

        verify(() => mockedPokemonDataSource.getPokemons()).called(1);
        expect(result.length, 2);
      });
    });

    group('fetchPokemon', () {
      test('should return $RemoteExtendedPokemon', () async {
        final expected = RemoteExtendedPokemon(
          1,
          'name',
          12,
          12,
          12,
          [],
          [],
          null,
          [],
          [],
        );
        mockedPokemonDataSource.mockFetchPokemon(expected);

        final result = await pokemonRepository.fetchPokemon(1);

        verify(() => mockedPokemonDataSource.fetchPokemon(1)).called(1);
        expect(result, expected);
      });
    });
  });
}
