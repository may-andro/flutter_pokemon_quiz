import 'package:domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockedFeatureToggleRepository extends Mock
    implements FeatureToggleRepository {
  void mockGetFeatureToggleValue(bool expected) {
    when(() => getFeatureToggleValue(any())).thenReturn(expected);
  }

  void mockRemoteFeatureConfigs(List<FeatureConfig> expected) {
    when(() => remoteFeatureConfigs).thenReturn(expected);
  }
}
