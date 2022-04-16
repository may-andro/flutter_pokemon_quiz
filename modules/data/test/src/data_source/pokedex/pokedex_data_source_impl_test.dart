import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/data_source/pokedex/pokedex_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

import '../../mock/client/mocked_firestore_client.dart';

void main() {
  group(PokedexDataSourceImpl, () {
    late MockedFireStoreClient mockedFireStoreClient;

    late PokedexDataSource pokedexDataSource;

    setUp(() {
      mockedFireStoreClient = MockedFireStoreClient();

      pokedexDataSource = PokedexDataSourceImpl(mockedFireStoreClient);
    });

    group('fetchPokedex', () {
      test('should return $RemotePokedex', () async {
        const remotePokedex = RemotePokedex([]);
        mockedFireStoreClient.mockFetchPokedex(remotePokedex);

        final result = await pokedexDataSource.fetchPokedex('');

        expect(result, remotePokedex);
      });

      test('should throw error when $FireStoreClient throws error ', () {
        mockedFireStoreClient.mockFetchPokedexThrowException();

        expect(
          () => pokedexDataSource.fetchPokedex(''),
          throwsA(isA<Exception>()),
        );
      });
    });
  });
}
