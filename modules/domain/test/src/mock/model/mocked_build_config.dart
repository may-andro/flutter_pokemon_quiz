import 'package:domain/src/model/model.dart';
import 'package:mocktail/mocktail.dart';

class MockedBuildConfig extends Mock implements BuildConfig {
  void mockEnvironment(BuildEnvironment expected) {
    when(() => buildEnvironment).thenReturn(expected);
  }

  void mockFlavor(BuildFlavor expected) {
    when(() => buildFlavor).thenReturn(expected);
  }
}
