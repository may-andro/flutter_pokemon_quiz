import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/repository/feature_toggle/feature_toggle_repository.dart';
import 'package:data/src/repository/feature_toggle/feature_toggle_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

import '../../mock/data_source/feature_toggle/mocked_feature_toggle_data_source.dart';

void main() {
  group(FeatureToggleRepositoryImpl, () {
    setUpAll(() {
      registerFallbackValue(
        RemoteConfigFeature.feature_toggle_developer_option,
      );
    });

    late MockedFeatureToggleDataSource mockedFeatureToggleDataSource;

    late FeatureToggleRepository featureToggleRepository;

    setUp(() {
      mockedFeatureToggleDataSource = MockedFeatureToggleDataSource();

      featureToggleRepository = FeatureToggleRepositoryImpl(
        mockedFeatureToggleDataSource,
      );
    });

    group('getFeatureToggleValue', () {
      test('should return true value for $RemoteConfigFeature', () {
        mockedFeatureToggleDataSource.mockedGetFeatureToggleValue(true);

        final result = featureToggleRepository.getFeatureToggleValue(
          RemoteConfigFeature.feature_toggle_developer_option,
        );

        expect(result, isTrue);
        verify(
          () => mockedFeatureToggleDataSource.getFeatureToggleValue(
            RemoteConfigFeature.feature_toggle_developer_option,
          ),
        ).called(1);
      });

      test('should return false value for $RemoteConfigFeature', () {
        mockedFeatureToggleDataSource.mockedGetFeatureToggleValue(false);

        final result = featureToggleRepository.getFeatureToggleValue(
          RemoteConfigFeature.feature_toggle_developer_option,
        );

        expect(result, isFalse);
        verify(
          () => mockedFeatureToggleDataSource.getFeatureToggleValue(
            RemoteConfigFeature.feature_toggle_developer_option,
          ),
        ).called(1);
      });
    });

    group('remoteFeatureConfigs', () {
      test('should return map of key $RemoteConfigFeature and bool value', () {
        final remoteFeatureConfigs = <RemoteConfigFeature, bool>{
          RemoteConfigFeature.feature_toggle_developer_option: false,
        };
        mockedFeatureToggleDataSource.mockRemoteConfigFeatures(
          remoteFeatureConfigs,
        );

        final result = featureToggleRepository.remoteFeatureConfigs;

        expect(result, remoteFeatureConfigs);
        verify(() => mockedFeatureToggleDataSource.remoteConfigFeatures)
            .called(1);
      });
    });

    group('disableFeatureToggle', () {
      test('should call $FeatureToggleDataSource', () {
        featureToggleRepository.disableFeatureToggle(
          RemoteConfigFeature.feature_toggle_developer_option,
        );

        verify(() => mockedFeatureToggleDataSource.disableFeatureToggleValue(
              RemoteConfigFeature.feature_toggle_developer_option,
            )).called(1);
      });
    });

    group('enableFeatureToggle', () {
      test('should call $FeatureToggleDataSource', () {
        featureToggleRepository.enableFeatureToggle(
          RemoteConfigFeature.feature_toggle_developer_option,
        );

        verify(() => mockedFeatureToggleDataSource.enableFeatureToggleValue(
              any(),
            )).called(1);
      });
    });
  });
}
