import 'package:domain/src/mapper/mapper.dart';
import 'package:domain/src/model/model.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

import '../../mock/repository/feature_toggle/mocked_feature_toggle_repository.dart';

void main() {
  group(IsFeatureEnabledUseCase, () {
    setUpAll(() {
      registerFallbackValue(
        RemoteConfigFeature.feature_toggle_developer_option,
      );
    });

    late MockedFeatureToggleRepository mockedFeatureToggleRepository;
    late FeatureToggleMapper featureToggleMapper;

    late IsFeatureEnabledUseCase isFeatureEnabledUseCase;

    setUp(() {
      featureToggleMapper = FeatureToggleMapper();
      mockedFeatureToggleRepository = MockedFeatureToggleRepository();

      isFeatureEnabledUseCase = IsFeatureEnabledUseCase(
        mockedFeatureToggleRepository,
        featureToggleMapper,
      );
    });

    group('call', () {
      test('should return true when feature is enable', () {
        mockedFeatureToggleRepository.mockGetFeatureToggleValue(true);

        final result = isFeatureEnabledUseCase.call(Feature.pokedex);

        verify(
          () => mockedFeatureToggleRepository.getFeatureToggleValue(
            featureToggleMapper.mapFromModelToEntity(Feature.pokedex),
          ),
        ).called(1);
        expect(result, isTrue);
      });
    });
  });
}
