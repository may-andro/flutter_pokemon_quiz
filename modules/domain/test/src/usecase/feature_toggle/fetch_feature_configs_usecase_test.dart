import 'package:data/data.dart';
import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

import '../../mock/repository/feature_toggle/mocked_feature_toggle_repository.dart';

void main() {
  group(FetchFeatureConfigsUseCase, () {
    late MockedFeatureToggleRepository mockedFeatureToggleRepository;
    late FeatureToggleMapper featureToggleMapper;

    late FetchFeatureConfigsUseCase fetchFeatureConfigsUseCase;

    setUp(() {
      featureToggleMapper = FeatureToggleMapper();
      mockedFeatureToggleRepository = MockedFeatureToggleRepository();

      fetchFeatureConfigsUseCase = FetchFeatureConfigsUseCase(
        mockedFeatureToggleRepository,
        featureToggleMapper,
      );
    });

    group('call', () {
      test(
          'should call $FeatureToggleRepository '
          '& return list of $FeatureConfig', () {
        final configMap = <RemoteConfigFeature, bool>{
          RemoteConfigFeature.feature_toggle_pokedex: true,
          RemoteConfigFeature.feature_toggle_developer_option: false,
        };
        mockedFeatureToggleRepository.mockRemoteFeatureConfigs(configMap);

        final result = fetchFeatureConfigsUseCase.call();

        verify(
          () => mockedFeatureToggleRepository.remoteFeatureConfigs,
        ).called(1);
        expect(
          result,
          const [
            FeatureConfig(true, Feature.pokedex),
            FeatureConfig(false, Feature.developer_mode),
          ],
        );
      });
    });
  });
}
