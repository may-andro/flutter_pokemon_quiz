import 'package:data/data.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class MockedPokedexRepository extends Mock implements PokedexRepository {
  void mockFetchPokedex(RemotePokedex expected) {
    when(() => fetchPokedex(any())).thenAnswer((_) => Future.value(expected));
  }

  void mockFetchPokedexException(Exception exception) {
    when(() => fetchPokedex(any())).thenThrow(exception);
  }
}
