import 'package:data/src/data_source/pokedex/pokedex_data_source.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class MockedPokedexDataSource extends Mock implements PokedexDataSource {
  void mockFetchPokedex(RemotePokedex expected) {
    when(() => fetchPokedex(any())).thenAnswer((_) => Future.value(expected));
  }
}
