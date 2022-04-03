import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/src/client/firebase/remote_config_client.dart';
import 'package:network/src/entity/remote_config/remote_config_feature.dart';

import 'mock/mocked_firebase_remote_config.dart';

void main() {
  group(RemoteConfigClient, () {
    late MockedFirebaseRemoteConfig mockedFirebaseRemoteConfig;

    late RemoteConfigClient remoteConfigClient;

    setUp(() {
      mockedFirebaseRemoteConfig = MockedFirebaseRemoteConfig();
      mockedFirebaseRemoteConfig.mockSetDefaults();
      mockedFirebaseRemoteConfig.mockSetConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      remoteConfigClient = RemoteConfigClient(mockedFirebaseRemoteConfig);
    });

    group('initialise', () {
      test('should return true when configs are activated', () async {
        mockedFirebaseRemoteConfig.mockFetch();
        mockedFirebaseRemoteConfig.mockActivate(true);

        final result = await remoteConfigClient.initialise();

        expect(result, isTrue);
      });

      test('should return false when configs are already activated', () async {
        mockedFirebaseRemoteConfig.mockFetch();
        mockedFirebaseRemoteConfig.mockActivate(false);

        final result = await remoteConfigClient.initialise();

        expect(result, isFalse);
      });

      test('should handle if fetch is failed', () async {
        mockedFirebaseRemoteConfig.mockFetchThrowsException(Exception());
        mockedFirebaseRemoteConfig.mockActivate(true);

        try {
          await remoteConfigClient.initialise();
        } catch (e) {
          fail('An expected error');
        }
      });
    });

    group('getValue', () {
      test('should return value from $RemoteConfigClient', () {
        const featureTest1 = RemoteConfigFeature.feature_toggle_pokemon_detail;
        const featureTest2 = RemoteConfigFeature.feature_toggle_pokedex;
        mockedFirebaseRemoteConfig.mockGetBool(featureTest1.name, true);
        mockedFirebaseRemoteConfig.mockGetBool(featureTest2.name, false);

        expect(remoteConfigClient.getValue(featureTest1), isTrue);
        expect(remoteConfigClient.getValue(featureTest2), isFalse);
      });
    });
  });
}
