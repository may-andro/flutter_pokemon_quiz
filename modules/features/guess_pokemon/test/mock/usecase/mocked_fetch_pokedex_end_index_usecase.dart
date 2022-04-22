import 'package:domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockedFetchPokedexEndIndexUseCase extends Mock
    implements FetchPokedexEndIndexUseCase {
  void mockCall(int expected) {
    when(() => call()).thenReturn(expected);
  }
}
