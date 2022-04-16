import 'package:data/src/data_source/feature_toggle/feature_toggle_data_source.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class MockedFeatureToggleDataSource extends Mock
    implements FeatureToggleDataSource {
  void mockRemoteConfigFeatures(Map<RemoteConfigFeature, bool> expected) {
    when(() => remoteConfigFeatures).thenReturn(expected);
  }

  void mockedGetFeatureToggleValue(bool expected) {
    when(() => getFeatureToggleValue(any())).thenReturn(expected);
  }
}
