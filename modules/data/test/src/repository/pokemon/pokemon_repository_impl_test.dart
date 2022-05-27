import 'package:data/src/data_source/pokemon/pokemon_data_source.dart';
import 'package:data/src/mapper/mapper.dart';
import 'package:data/src/repository/pokemon/pokemon_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local/local.dart';
import 'package:local/objectbox.g.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

import '../../mock/data_source/pokedex/mocked_pokedex_data_source.dart';
import '../../mock/data_source/pokemon/mocked_pokemon_data_source.dart';

const _testPokemon = Pokemon(
  index: 1,
  name: 'name',
  baseExperience: 12,
  weight: 12,
  height: 12,
  imageUrl: '',
  abilities: [],
  stats: [],
  moves: [],
  types: [],
  isFavorite: false,
  isCaptured: false,
);

final _testLocalPokemon = LocalPokemon(
  imageUrl: '',
  name: '',
  id: 1,
);

void main() {
  group(PokemonRepositoryImpl, () {
    setUpAll(() {
      registerFallbackValue(LocalPokemon_.isFavorite.equals(true));
      registerFallbackValue(_testPokemon);
      registerFallbackValue(_testLocalPokemon);
    });

    late MockedPokemonDataSource mockedPokemonDataSource;
    late MockedPokedexDataSource mockedPokedexDataSource;
    late PokemonRemoteMapper pokemonRemoteMapper;
    late ExtendedPokemonRemoteMapper extendedPokemonRemoteMapper;
    late PokemonStatsRemoteMapper pokemonStatsRemoteMapper;

    late PokemonRepository pokemonRepository;

    setUp(() {
      mockedPokemonDataSource = MockedPokemonDataSource();
      mockedPokedexDataSource = MockedPokedexDataSource();
      pokemonStatsRemoteMapper = PokemonStatsRemoteMapper();
      pokemonRemoteMapper = PokemonRemoteMapper(pokemonStatsRemoteMapper);
      extendedPokemonRemoteMapper = ExtendedPokemonRemoteMapper();

      pokemonRepository = PokemonRepositoryImpl(
        mockedPokemonDataSource,
        mockedPokedexDataSource,
        pokemonRemoteMapper,
        extendedPokemonRemoteMapper,
      );
    });

    group('fetchPokedex', () {
      test('should return ${List<Pokemon>}', () async {
        const remotePokedex = RemotePokedex(<RemotePokemon>[]);
        mockedPokedexDataSource.mockFetchPokedex(remotePokedex);

        final result = await pokemonRepository.fetchPokedex('kanto');

        expect(result, []);
        verify(() => mockedPokedexDataSource.fetchPokedex('kanto')).called(1);
      });
    });

    group('fetchPokemon', () {
      test('should return $Pokemon', () async {
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
        mockedPokemonDataSource.mockQueryPokemon([]);

        final result = await pokemonRepository.fetchPokemon(1);

        verify(() => mockedPokemonDataSource.fetchPokemon(1)).called(1);
        expect(
          result,
          _testPokemon,
        );
      });
    });

    group('addToFavorites', () {
      test('should call $PokemonDataSource', () {
        mockedPokemonDataSource.mockPutPokemon(1);

        final result = pokemonRepository.addToFavorites(_testPokemon);

        expect(result, 1);
        verify(
          () => mockedPokemonDataSource.putPokemon(any()),
        ).called(1);
      });
    });

    group('queryIsFavoritePokemon', () {
      test(
          'should return false when '
          'query returns empty list', () {
        final pokemons = <LocalPokemon>[];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.isFavoritePokemon(1);

        expect(result, isFalse);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });

      test(
          'should return true when query returns non empty list &'
          ' isFavorite is true ', () {
        final pokemons = [
          LocalPokemon(imageUrl: '', name: '', id: 1, isFavorite: true)
        ];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.isFavoritePokemon(1);

        expect(result, isTrue);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });

      test(
          'should return false when query returns non empty list &'
          ' isFavorite is false ', () {
        final pokemons = [_testLocalPokemon];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.isFavoritePokemon(1);

        expect(result, isFalse);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });
    });

    group('removeFromFavorites', () {
      test('should call $PokemonDataSource', () {
        mockedPokemonDataSource.mockPutPokemon(1);

        final result = pokemonRepository.removeFromFavorites(_testPokemon);

        expect(result, 1);
        verify(() => mockedPokemonDataSource.putPokemon(any())).called(1);
      });
    });

    group('addToCaptured', () {
      test('should call $PokemonDataSource', () {
        mockedPokemonDataSource.mockPutPokemon(1);

        final result = pokemonRepository.addToCaptured(_testPokemon);

        expect(result, 1);
        verify(() => mockedPokemonDataSource.putPokemon(any())).called(1);
      });
    });

    group('isCapturedPokemon', () {
      test(
          'should return false when '
          'query returns empty list', () {
        final pokemons = <LocalPokemon>[];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.isCapturedPokemon(1);

        expect(result, isFalse);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });

      test(
          'should return true when query returns non empty list &'
          ' isCaptured is true ', () {
        final pokemons = [
          LocalPokemon(imageUrl: '', name: '', id: 1, isCaptured: true)
        ];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.isCapturedPokemon(1);

        expect(result, isTrue);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });

      test(
          'should return false when query returns non empty list &'
          ' isCaptured is false ', () {
        final pokemons = [_testLocalPokemon];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.isCapturedPokemon(1);

        expect(result, isFalse);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });
    });
  });
}
