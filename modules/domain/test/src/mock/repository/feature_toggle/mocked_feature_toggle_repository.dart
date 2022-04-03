import 'package:data/data.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class MockedFeatureToggleRepository extends Mock
    implements FeatureToggleRepository {
  void mockGetFeatureToggleValue(bool expected) {
    when(() => getFeatureToggleValue(any())).thenReturn(expected);
  }

  void mockRemoteFeatureConfigs(Map<RemoteConfigFeature, bool> expected) {
    when(() => remoteFeatureConfigs).thenReturn(expected);
  }
}
