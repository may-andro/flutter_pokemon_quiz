import 'package:domain/src/model/model.dart';
import 'package:domain/src/repository/feature_toggle/feature_toggle_repository.dart';
import 'package:domain/src/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake/repository/feature_toggle/fake_feature_toggle_repository.dart';

void main() {
  group(DisableFeatureToggleUseCase, () {
    late FeatureToggleRepository featureToggleRepository;

    late DisableFeatureToggleUseCase disableFeatureToggleUseCase;

    setUp(() {
      featureToggleRepository = FakeFeatureToggleRepository();

      disableFeatureToggleUseCase = DisableFeatureToggleUseCase(
        featureToggleRepository,
      );
    });

    group('call', () {
      test('should set isEnabled to false for the $Feature', () {
        disableFeatureToggleUseCase.call(Feature.pokedex);

        expect(
          featureToggleRepository.getFeatureToggleValue(Feature.pokedex),
          isFalse,
        );
      });
    });
  });
}
