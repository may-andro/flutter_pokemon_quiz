import 'package:network/network.dart';
import 'package:mocktail/mocktail.dart';

class MockedRemoteConfigClient extends Mock implements RemoteConfigClient {
  void mockGetValue(bool expected, [RemoteConfigFeature? remoteConfigFeature]) {
    when(() => getValue(remoteConfigFeature ?? any())).thenReturn(expected);
  }
}
