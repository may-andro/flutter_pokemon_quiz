import 'package:domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockedIsFeatureEnabledUseCase extends Mock
    implements IsFeatureEnabledUseCase {
  void mockCall(bool expected) {
    when(() => call(any())).thenReturn(expected);
  }
}
