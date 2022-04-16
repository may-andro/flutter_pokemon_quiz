import 'package:data/src/data_source/pokemon/pokemon_data_source.dart';
import 'package:data/src/repository/pokemon/pokemon_repository.dart';
import 'package:data/src/repository/pokemon/pokemon_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local/local.dart';
import 'package:local/objectbox.g.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

import '../../mock/data_source/pokemon/mocked_pokemon_data_source.dart';

void main() {
  group(PokemonRepositoryImpl, () {
    setUpAll(() {
      registerFallbackValue(LocalPokemon_.isFavorite.equals(true));
    });

    late MockedPokemonDataSource mockedPokemonDataSource;

    late PokemonRepository pokemonRepository;

    setUp(() {
      mockedPokemonDataSource = MockedPokemonDataSource();

      pokemonRepository = PokemonRepositoryImpl(mockedPokemonDataSource);
    });

    group('putPokemon', () {
      test('should call $PokemonDataSource', () {
        final localPokemon = LocalPokemon(
          id: 1,
          name: 'name',
          imageUrl: 'imageUrl',
        );
        mockedPokemonDataSource.mockPutPokemon(localPokemon);

        final result = pokemonRepository.putPokemon(localPokemon);

        expect(result, localPokemon.id);
        verify(() => mockedPokemonDataSource.putPokemon(localPokemon))
            .called(1);
      });
    });

    group('removePokemon', () {
      test('should return true when $PokemonDataSource removes a value', () {
        mockedPokemonDataSource.mockRemovePokemon(true);

        final bool = pokemonRepository.removePokemon(1);

        expect(bool, isTrue);
        verify(() => mockedPokemonDataSource.removePokemon(1)).called(1);
      });

      test(
          'should return true when'
          ' $PokemonDataSource does not removes a value', () {
        mockedPokemonDataSource.mockRemovePokemon(false);

        final bool = pokemonRepository.removePokemon(1);

        expect(bool, isFalse);
        verify(() => mockedPokemonDataSource.removePokemon(1)).called(1);
      });
    });

    group('getPokemons', () {
      test('should return $LocalPokemon list ', () {
        mockedPokemonDataSource.mockGetPokemons([]);

        final result = pokemonRepository.getPokemons();

        verify(() => mockedPokemonDataSource.getPokemons()).called(1);
        expect(result, []);
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

    group('queryFavoritePokemons', () {
      test('should return ${List<LocalPokemon>} from $PokemonDataSource', () {
        final pokemons = <LocalPokemon>[];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.queryFavoritePokemons();

        expect(result, pokemons);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });
    });

    group('queryCapturedPokemons', () {
      test('should return ${List<LocalPokemon>} from $PokemonDataSource', () {
        final pokemons = <LocalPokemon>[];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.queryCapturedPokemons();

        expect(result, pokemons);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });
    });

    group('queryIsCapturedPokemon', () {
      test(
          'should return false when '
          'query returns empty list', () {
        final pokemons = <LocalPokemon>[];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.queryIsCapturedPokemon(1);

        expect(result, isFalse);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });

      test(
          'should return true when query returns non empty list &'
          ' isCaptured is true ', () {
        final pokemons = [
          LocalPokemon(
            imageUrl: '',
            name: '',
            id: 1,
            isCaptured: true,
          )
        ];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.queryIsCapturedPokemon(1);

        expect(result, isTrue);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });

      test(
          'should return false when query returns non empty list &'
          ' isCaptured is false ', () {
        final pokemons = [
          LocalPokemon(
            imageUrl: '',
            name: '',
            id: 1,
          )
        ];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.queryIsCapturedPokemon(1);

        expect(result, isFalse);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });
    });

    group('queryIsFavoritePokemon', () {
      test(
          'should return false when '
          'query returns empty list', () {
        final pokemons = <LocalPokemon>[];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.queryIsFavoritePokemon(1);

        expect(result, isFalse);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });

      test(
          'should return true when query returns non empty list &'
          ' isFavorite is true ', () {
        final pokemons = [
          LocalPokemon(
            imageUrl: '',
            name: '',
            id: 1,
            isFavorite: true,
          )
        ];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.queryIsFavoritePokemon(1);

        expect(result, isTrue);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });

      test(
          'should return false when query returns non empty list &'
          ' isFavorite is false ', () {
        final pokemons = [
          LocalPokemon(
            imageUrl: '',
            name: '',
            id: 1,
          )
        ];
        mockedPokemonDataSource.mockQueryPokemon(pokemons);

        final result = pokemonRepository.queryIsFavoritePokemon(1);

        expect(result, isFalse);
        verify(() => mockedPokemonDataSource.queryPokemon(any())).called(1);
      });
    });
  });
}
