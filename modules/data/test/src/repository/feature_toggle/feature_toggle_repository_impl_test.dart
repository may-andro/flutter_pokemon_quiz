import 'package:data/src/data_source/data_source.dart';
import 'package:data/src/mapper/feature_toggle/feature_toggle_mapper.dart';
import 'package:data/src/repository/feature_toggle/feature_toggle_repository_impl.dart';
import 'package:domain/domain.dart';
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
    late FeatureToggleMapper featureToggleMapper;

    late FeatureToggleRepository featureToggleRepository;

    setUp(() {
      mockedFeatureToggleDataSource = MockedFeatureToggleDataSource();
      featureToggleMapper = FeatureToggleMapper();

      featureToggleRepository = FeatureToggleRepositoryImpl(
        mockedFeatureToggleDataSource,
        featureToggleMapper,
      );
    });

    group('getFeatureToggleValue', () {
      test('should return true value when $Feature is active', () {
        mockedFeatureToggleDataSource.mockedGetFeatureToggleValue(true);

        final result = featureToggleRepository.getFeatureToggleValue(
          Feature.developer_mode,
        );

        expect(result, isTrue);
        verify(
          () => mockedFeatureToggleDataSource.getFeatureToggleValue(
            RemoteConfigFeature.feature_toggle_developer_option,
          ),
        ).called(1);
      });

      test('should return false when $Feature is inactive', () {
        mockedFeatureToggleDataSource.mockedGetFeatureToggleValue(false);

        final result = featureToggleRepository.getFeatureToggleValue(
          Feature.developer_mode,
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
      test('should return ${List<FeatureConfig>}', () {
        final remoteFeatureConfigs = <RemoteConfigFeature, bool>{
          RemoteConfigFeature.feature_toggle_developer_option: false,
        };
        mockedFeatureToggleDataSource.mockRemoteConfigFeatures(
          remoteFeatureConfigs,
        );

        final result = featureToggleRepository.remoteFeatureConfigs;

        expect(result, [
          const FeatureConfig(
            isEnabled: false,
            feature: Feature.developer_mode,
          )
        ]);
        verify(
          () => mockedFeatureToggleDataSource.remoteConfigFeatures,
        ).called(1);
      });
    });

    group('disableFeatureToggle', () {
      test('should call $FeatureToggleDataSource', () {
        featureToggleRepository.disableFeatureToggle(Feature.developer_mode);

        verify(
          () => mockedFeatureToggleDataSource.disableFeatureToggleValue(
            RemoteConfigFeature.feature_toggle_developer_option,
          ),
        ).called(1);
      });
    });

    group('enableFeatureToggle', () {
      test('should call $FeatureToggleDataSource', () {
        featureToggleRepository.enableFeatureToggle(Feature.developer_mode);

        verify(
          () => mockedFeatureToggleDataSource.enableFeatureToggleValue(
            any(),
          ),
        ).called(1);
      });
    });
  });
}
