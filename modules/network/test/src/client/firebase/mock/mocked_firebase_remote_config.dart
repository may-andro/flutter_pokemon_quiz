import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mocktail/mocktail.dart';

class MockedFirebaseRemoteConfig extends Mock implements FirebaseRemoteConfig {
  void mockGetBool(String key, bool expected) {
    when(() => getBool(key)).thenReturn(expected);
  }

  void mockActivate(bool expected) {
    when(activate).thenAnswer((_) => Future.value(expected));
  }

  void mockSetConfigSettings(RemoteConfigSettings expected) {
    when(() => setConfigSettings(expected))
        .thenAnswer((_) => Future.value(null));
  }

  void mockSetDefaults() {
    when(() => setDefaults(any())).thenAnswer((_) => Future.value(null));
  }

  void mockFetch() {
    when(fetch).thenAnswer((_) => Future.value(null));
  }

  void mockFetchThrowsException(Exception exception) {
    when(fetch).thenThrow(exception);
  }
}
