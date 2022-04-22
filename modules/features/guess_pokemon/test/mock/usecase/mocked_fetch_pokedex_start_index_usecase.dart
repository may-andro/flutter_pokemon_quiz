import 'package:domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockedFetchPokedexStartIndexUseCase extends Mock
    implements FetchPokedexStartIndexUseCase {
  void mockCall(int expected) {
    when(() => call()).thenReturn(expected);
  }
}
