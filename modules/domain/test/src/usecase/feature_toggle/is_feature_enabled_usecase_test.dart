import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/feature_toggle/feature_toggle_repository.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake/repository/feature_toggle/fake_feature_toggle_repository.dart';

void main() {
  group(IsFeatureEnabledUseCase, () {
    late FeatureToggleRepository featureToggleRepository;

    late IsFeatureEnabledUseCase isFeatureEnabledUseCase;

    setUp(() {
      featureToggleRepository = FakeFeatureToggleRepository();

      isFeatureEnabledUseCase = IsFeatureEnabledUseCase(
        featureToggleRepository,
      );
    });

    group('call', () {
      test(
          'should return true when feature is enable '
          '& false when disabled', () {
        featureToggleRepository.enableFeatureToggle(Feature.pokedex);

        final resultEnabled = isFeatureEnabledUseCase.call(Feature.pokedex);

        expect(resultEnabled, isTrue);

        featureToggleRepository.disableFeatureToggle(Feature.pokedex);

        final resultDisabled = isFeatureEnabledUseCase.call(Feature.pokedex);

        expect(resultDisabled, isFalse);
      });
    });
  });
}
