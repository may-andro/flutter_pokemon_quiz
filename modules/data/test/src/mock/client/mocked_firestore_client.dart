import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class MockedFireStoreClient extends Mock implements FireStoreClient {
  void mockFetchPokedex(RemotePokedex expected) {
    when(() => fetchPokedex(any())).thenAnswer((_) => Future.value(expected));
  }

  void mockFetchPokedexThrowException() {
    when(() => fetchPokedex(any())).thenThrow(Exception());
  }
}
