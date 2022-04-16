import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/data_source/pokemon/pokemon_data_source_impl.dart';
import 'package:data/src/exception/parse_failure_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local/local.dart';
import 'package:local/objectbox.g.dart';
import 'package:network/network.dart';
import 'package:dio/dio.dart';

import '../../fake/fake_pokemon_local_client.dart';
import '../../mock/client/mocked_remote_client.dart';

void main() {
  group(PokemonDataSourceImpl, () {
    late FakePokemonLocalClient fakePokemonLocalClient;
    late MockedRemoteClient mockedRemoteClient;

    late PokemonDataSource pokemonDataSource;

    setUp(() {
      fakePokemonLocalClient = FakePokemonLocalClient();
      mockedRemoteClient = MockedRemoteClient();

      pokemonDataSource = PokemonDataSourceImpl(
        fakePokemonLocalClient,
        mockedRemoteClient,
      );
    });

    group('getPokemons', () {
      test(
          'should return empty ${List<LocalPokemon>} '
          'when $LocalClient return empty list', () {
        final localPokemons = <LocalPokemon?>[];

        final result = pokemonDataSource.getPokemons();

        expect(result, localPokemons);
      });

      test(
          'should return list ${List<LocalPokemon>} '
          'when $LocalClient return list', () {
        final localPokemons = <LocalPokemon>[
          LocalPokemon(
            id: 1,
            name: 'Test',
            imageUrl: '',
          ),
        ];
        fakePokemonLocalClient.putMany(localPokemons);

        final result = pokemonDataSource.getPokemons();

        expect(result, localPokemons);
      });
    });

    group('putPokemon', () {
      test('should put $LocalPokemon in local ', () {
        final localPokemon = LocalPokemon(
          id: 1,
          name: 'Test',
          imageUrl: '',
        );
        fakePokemonLocalClient.put(localPokemon);

        pokemonDataSource.putPokemon(localPokemon);

        expect(
          pokemonDataSource
              .getPokemons()
              .firstWhere((element) => element.id == localPokemon.id),
          localPokemon,
        );
        expect(
          pokemonDataSource.getPokemons().length,
          2,
        );
      });
    });

    group('removePokemon', () {
      test('should remove $LocalPokemon from local ', () {
        final localPokemon = LocalPokemon(
          id: 1,
          name: 'Test',
          imageUrl: '',
        );
        fakePokemonLocalClient.put(localPokemon);

        pokemonDataSource.removePokemon(localPokemon.id);

        expect(
          pokemonDataSource.getPokemons().length,
          0,
        );
      });
    });

    group('fetchPokemon', () {
      test('should return $RemoteExtendedPokemon', () async {
        final responseMap = <String, dynamic>{
          'id': 1,
          'name': 'bulbasaur',
          'base_experience': 64,
          'weight': 69,
          'height': 7,
          'abilities': [],
          'moves': [],
          'types': [],
          'stats': [],
          'sprites': null,
        };
        final response = Response<Map<String, dynamic>>(
          data: responseMap,
          requestOptions: MockedRequestOptions(),
        );
        mockedRemoteClient.mockGetApiCall<Map<String, dynamic>>(response);

        final result = await pokemonDataSource.fetchPokemon(1);

        expect(result, isA<RemoteExtendedPokemon>());
      });

      test('should throw $ParsingException when parsing fails', () {
        final responseMap = <String, dynamic>{
          'id': 1,
          'name': 'bulbasaur',
          'baseExperience': 64,
          'weight': 69,
          'height': 7,
          'abilities': [],
          'moves': [],
          'types': [],
          'stats': [],
          'sprites': null,
        };
        final response = Response<Map<String, dynamic>>(
          data: responseMap,
          requestOptions: MockedRequestOptions(),
        );
        mockedRemoteClient.mockGetApiCall<Map<String, dynamic>>(response);

        expect(
          pokemonDataSource.fetchPokemon(1),
          throwsA(isA<ParsingException>()),
        );
      });

      test('should throw $Exception when parsing fails', () {
        mockedRemoteClient.mockGetApiCallThrowsException();

        expect(
          pokemonDataSource.fetchPokemon(1),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('queryPokemon', () {
      test('should query $LocalClient', () {
        final query = LocalPokemon_.isFavorite.equals(true);

        final result = pokemonDataSource.queryPokemon(query);

        expect(result, <LocalPokemon?>[]);
      });
    });
  });
}
