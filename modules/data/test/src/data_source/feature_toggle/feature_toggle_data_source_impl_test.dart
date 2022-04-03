import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/data_source/feature_toggle/feature_toggle_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

import '../../mock/client/mocked_remote_config_client.dart';

void main() {
  group(FeatureToggleDataSourceImpl, () {
    setUpAll(() {
      registerFallbackValue(
        RemoteConfigFeature.feature_toggle_developer_option,
      );
    });

    late MockedRemoteConfigClient mockedRemoteConfigClient;
    late FeatureToggleDataSource featureToggleDataSource;

    setUp(() {
      mockedRemoteConfigClient = MockedRemoteConfigClient();
      mockedRemoteConfigClient.mockGetValue(
        true,
      );
      mockedRemoteConfigClient.mockGetValue(
        false,
        RemoteConfigFeature.feature_toggle_developer_option,
      );

      featureToggleDataSource = FeatureToggleDataSourceImpl(
        mockedRemoteConfigClient,
      );
    });

    group('getFeatureToggleValue', () {
      test('should return true when $RemoteConfigClient return true', () {
        final result = featureToggleDataSource.getFeatureToggleValue(
          RemoteConfigFeature.feature_toggle_pokedex,
        );
        expect(result, isTrue);
      });

      test('should return false when $RemoteConfigClient return false', () {
        final result = featureToggleDataSource.getFeatureToggleValue(
          RemoteConfigFeature.feature_toggle_developer_option,
        );
        expect(result, isFalse);
      });
    });

    group('remoteConfigFeatures', () {
      test('should return map of key $RemoteConfigFeature and bool value', () {
        final result = featureToggleDataSource.remoteConfigFeatures;
        expect(result, isA<Map<RemoteConfigFeature, bool>>());
        expect(
          result[RemoteConfigFeature.feature_toggle_developer_option],
          false,
        );
      });
    });

    group('disableFeatureToggleValue', () {
      test('should set value to false for $RemoteConfigFeature key', () {
        featureToggleDataSource.disableFeatureToggleValue(
          RemoteConfigFeature.feature_toggle_pokedex,
        );
        expect(
          featureToggleDataSource.getFeatureToggleValue(
            RemoteConfigFeature.feature_toggle_pokedex,
          ),
          isFalse,
        );
        expect(
          featureToggleDataSource.getFeatureToggleValue(
            RemoteConfigFeature.feature_toggle_pokemon_detail,
          ),
          isTrue,
        );
      });
    });

    group('enableFeatureToggleValue', () {
      test('should set value to true for $RemoteConfigFeature key', () {
        featureToggleDataSource.enableFeatureToggleValue(
          RemoteConfigFeature.feature_toggle_pokedex,
        );
        expect(
          featureToggleDataSource.getFeatureToggleValue(
            RemoteConfigFeature.feature_toggle_pokedex,
          ),
          isTrue,
        );
        expect(
          featureToggleDataSource.getFeatureToggleValue(
            RemoteConfigFeature.feature_toggle_developer_option,
          ),
          isFalse,
        );
      });
    });
  });
}
