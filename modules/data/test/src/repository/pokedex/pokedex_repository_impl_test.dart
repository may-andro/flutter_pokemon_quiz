import 'package:data/src/repository/pokedex/pokedex_repository.dart';
import 'package:data/src/repository/pokedex/pokedex_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

import '../../mock/data_source/pokedex/mocked_pokedex_data_source.dart';

void main() {
  group(PokedexRepositoryImpl, () {
    late MockedPokedexDataSource mockedPokedexDataSource;

    late PokedexRepository pokedexRepository;

    setUp(() {
      mockedPokedexDataSource = MockedPokedexDataSource();

      pokedexRepository = PokedexRepositoryImpl(mockedPokedexDataSource);
    });

    group('fetchPokedex', () {
      test('should return the $RemotePokedex', () async {
        const remotePokedex = RemotePokedex(<RemotePokemon>[]);
        mockedPokedexDataSource.mockFetchPokedex(remotePokedex);

        final result = await pokedexRepository.fetchPokedex('kanto');

        expect(result, remotePokedex);
        verify(() => mockedPokedexDataSource.fetchPokedex('kanto')).called(1);
      });
    });
  });
}
